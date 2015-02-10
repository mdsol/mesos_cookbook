#
# Cookbook Name:: mesos
# Recipe:: slave
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
node['mesos']['slave']['flags'].keys.each do |config_key|
  options_hash = node['mesos']['options']['slave']
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

directory '/etc/mesos-slave/'

template '/etc/default/mesos-slave' do
  source 'mesos-slave.erb'
  variables config: node['mesos']['slave']['env']
  notifies :run, 'bash[restart-mesos-slave]', :delayed
end

# generate our flag config template but only to detect changes
template '/etc/mesos-chef/mesos-slave-config' do
  source 'mesos-slave-chef-config.erb'
  variables config: node['mesos']['slave']['flags']
  mode 0644
  notifies :run, 'ruby_block[update_slave_config]', :immediately
end

ruby_block 'update_slave_config' do
  block do
    MesosHelper.update_mesos_options(node['mesos']['slave']['flags'], MesosServerType::SLAVE, node['mesos']['version'])
  end
  action :nothing
  notifies :run, 'bash[restart-mesos-slave]', :delayed
end

zk_server_list = []
zk_port = ''
zk_path = ''

if node['mesos']['zookeeper_server_list'].count > 0
  zk_server_list = node['mesos']['zookeeper_server_list']
  zk_port = node['mesos']['zookeeper_port']
  zk_path = node['mesos']['zookeeper_path']
end

if node['mesos']['zookeeper_exhibitor_discovery'] && node['mesos']['zookeeper_exhibitor_url']
  zk_nodes = discover_zookeepers_with_retry(node['mesos']['zookeeper_exhibitor_url'])

  zk_server_list = zk_nodes['servers']
  zk_port = zk_nodes['port']
  zk_path = node['mesos']['zookeeper_path']
end

unless zk_server_list.count == 0 && zk_port.empty? && zk_path.empty?
  Chef::Log.info("Zookeeper Server List: #{zk_server_list}")
  Chef::Log.info("Zookeeper Port: #{zk_port}")
  Chef::Log.info("Zookeeper Path: #{zk_path}")

  template '/etc/mesos/zk' do
    source 'zk.erb'
    variables(
      zookeeper_server_list: zk_server_list,
      zookeeper_port: zk_port,
      zookeeper_path: zk_path
    )
    notifies :run, 'bash[restart-mesos-slave]', :delayed
  end
end

# this directory doesn't exist on newer versions of Mesos, i.e. 0.21.0+
directory '/usr/local/var/mesos/deploy/' do
  recursive true
end

template '/usr/local/var/mesos/deploy/mesos-slave-env.sh.template' do
  source 'mesos-slave-env.sh.template.erb'
  variables(
    zookeeper_server_list: zk_server_list,
    zookeeper_port: zk_port,
    zookeeper_path: zk_path,
    logs_dir: node['mesos']['logs_dir'],
    work_dir: node['mesos']['work_dir'],
    isolation_type: node['mesos']['isolation_type']
  )
  notifies :run, 'bash[restart-mesos-slave]', :delayed
end

# If we are on ec2 set the public dns as the hostname so that
# mesos slave reports work properly in the UI.
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

# Set init to 'start' by default for mesos slave.
# This ensures that mesos-slave is started on restart
template '/etc/init/mesos-slave.conf' do
  source 'mesos-slave.conf.erb'
  variables(
    action: 'start'
  )
  notifies :run, 'bash[reload-configuration]'
end

if node['platform'] == 'debian'
  bash 'reload-configuration' do
    action :nothing
    user 'root'
    code <<-EOH
    update-rc.d mesos-slave defaults
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
  bash 'start-mesos-slave' do
    user 'root'
    code <<-EOH
    service mesos-slave start
    EOH
    not_if 'service mesos-slave status|grep "start\|is running"'
  end
else
  bash 'start-mesos-slave' do
    user 'root'
    code <<-EOH
    start mesos-slave
    EOH
    not_if 'status mesos-slave|grep "start\|running"'
  end
end

if node['platform'] == 'debian'
  bash 'restart-mesos-slave' do
    action :nothing
    user 'root'
    code <<-EOH
    service mesos-slave restart
    EOH
    not_if 'service mesos-slave status|grep "stop\|is not running"'
  end
else
  bash 'restart-mesos-slave' do
    action :nothing
    user 'root'
    code <<-EOH
    restart mesos-slave
    EOH
    not_if 'status mesos-slave|grep "stop\|waiting"'
  end
end
