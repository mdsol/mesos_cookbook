#
# Cookbook Name:: mesos
# Recipe:: master
#
# Copyright (C) 2015 Medidata Solutions, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef::Recipe
  include MesosHelper
end

include_recipe 'mesos::install'

# Check for valid configuration options
node['mesos']['master']['flags'].keys.each do |config_key|
  options_hash = node['mesos']['options']['master']
  unless options_hash.key? config_key
    Chef::Application.fatal!("Detected an invalid configuration option: #{config_key}. Aborting!", 1000)
  end

  unless options_hash[config_key]['version'].include?(node['mesos']['version'])
    Chef::Application.fatal!("Detected a configuration option that isn't available for this version of Mesos: #{config_key}. Aborting!", 1000)
  end

  if options_hash[config_key]['deprecated'] == true
    Chef::Log.warn("The following configuration option is deprecated: #{config_key}.")
  end
end

directory '/etc/mesos-master/'

template '/etc/default/mesos-master' do
  source 'mesos.erb'
  variables config: node['mesos']['master']['env']
  notifies :run, 'bash[restart-mesos-master]', :delayed
end

# generate our flag config template but only to detect changes
template '/etc/mesos-chef/mesos-master-config' do
  source 'mesos.erb'
  variables config: node['mesos']['master']['flags']
  mode 0644
  notifies :run, 'ruby_block[update_master_config]', :immediately
end

ruby_block 'update_master_config' do
  block do
    MesosHelper.update_mesos_options(node['mesos']['master']['flags'], MesosServerType::MASTER, node['mesos']['version'])
  end
  action :nothing
  notifies :run, 'bash[restart-mesos-master]', :delayed
end

if node['mesos']['zookeeper_server_list'].count > 0
  zk_server_list = node['mesos']['zookeeper_server_list']
  zk_port = node['mesos']['zookeeper_port']
  zk_path = node['mesos']['zookeeper_path']
end

if node['mesos']['zookeeper_exhibitor_discovery'] && node['mesos']['zookeeper_exhibitor_url']
  zk_nodes = MesosHelper.discover_zookeepers_with_retry(node['mesos']['zookeeper_exhibitor_url'])

  if zk_nodes.nil?
    Chef::Application.fatal!('Failed to discover zookeepers.  Cannot continue')
  end

  zk_server_list = zk_nodes['servers']
  zk_port = zk_nodes['port']
  zk_path = node['mesos']['zookeeper_path']
end

unless zk_server_list.nil? && zk_port.nil? && zk_path.nil?
  Chef::Log.info("Zookeeper Server List: #{zk_server_list}")
  Chef::Log.info("Zookeeper Port: #{zk_port}")
  Chef::Log.info("Zookeeper Path: #{zk_path}")

  template '/etc/mesos-master/zk' do
    source 'zk.erb'
    variables(
      zookeeper_server_list: zk_server_list,
      zookeeper_port: zk_port,
      zookeeper_path: zk_path
    )
    notifies :run, 'bash[restart-mesos-master]', :delayed
  end
end

# If we are on ec2 set the public dns as the hostname so that
# mesos master redirection works properly.
if node.attribute?('ec2') && node['mesos']['set_ec2_hostname']
  bash 'set-aws-public-hostname' do
    user 'root'
    code <<-EOH
      PUBLIC_DNS=`wget -q -O - http://instance-data.ec2.internal/latest/meta-data/public-hostname`
      hostname $PUBLIC_DNS
      echo $PUBLIC_DNS > /etc/hostname
      HOSTNAME=$PUBLIC_DNS  # Fix the bash built-in hostname variable too
    EOH
    not_if 'hostname | grep amazonaws.com'
  end
end

# Set init to 'start' by default for mesos master.
# This ensures that mesos-master is started on restart
template '/etc/init/mesos-master.conf' do
  source 'mesos-init.erb'
  variables(
    type:   'master',
    action: 'start'
  )
  notifies :run, 'bash[reload-configuration]'
end

if node['platform'] == 'debian'
  bash 'reload-configuration' do
    action :nothing
    user 'root'
    code <<-EOH
    update-rc.d mesos-master defaults
    EOH
  end
else
  bash 'reload-configuration' do
    action :nothing
    user 'root'
    code <<-EOH
    initctl reload-configuration
    EOH
  end
end

if node['platform'] == 'debian'
  bash 'start-mesos-master' do
    user 'root'
    code <<-EOH
    service mesos-master start
    EOH
    not_if 'service mesos-master status|grep "start\|is running"'
  end
else
  bash 'start-mesos-master' do
    user 'root'
    code <<-EOH
    start mesos-master
    EOH
    not_if 'status mesos-master|grep "start\|running"'
  end
end

if node['platform'] == 'debian'
  bash 'restart-mesos-master' do
    action :nothing
    user 'root'
    code <<-EOH
    service mesos-master restart
    EOH
    not_if 'service mesos-master status|grep "stop\|is not running"'
  end
else
  bash 'restart-mesos-master' do
    action :nothing
    user 'root'
    code <<-EOH
    restart mesos-master
    EOH
    not_if 'status mesos-master|grep "stop\|waiting"'
  end
end
