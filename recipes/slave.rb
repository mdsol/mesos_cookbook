#
# Cookbook Name:: mesos
# Recipe:: slave
#
# Copyright (C) 2013 Medidata Solutions, Inc.
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

class ::Chef::Recipe
  include ::Mesos
end

include_recipe 'mesos::install'

zk_server_list = []
zk_port = ''
zk_path = ''

template '/etc/default/mesos' do
  source 'mesos.erb'
  variables(
    logs_dir: node['mesos']['logs_dir'],
  )
  notifies :run, 'bash[restart-mesos-slave]', :delayed
end

template '/etc/default/mesos-slave' do
  source 'mesos-slave.erb'
  variables(
    work_dir: node['mesos']['work_dir'],
    isolation_type: node['mesos']['isolation_type'],
  )
  notifies :run, 'bash[restart-mesos-slave]', :delayed
end

if node['mesos']['zookeeper_server_list'].count > 0
  zk_server_list = node['mesos']['zookeeper_server_list']
  zk_port = node['mesos']['zookeeper_port']
  zk_path = node['mesos']['zookeeper_path']
end

if node['mesos']['zookeeper_exhibitor_discovery'] && !node['mesos']['zookeeper_exhibitor_url'].nil?
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
      zookeeper_path: zk_path,
    )
    notifies :run, 'bash[restart-mesos-slave]', :delayed
  end
end

template '/usr/local/var/mesos/deploy/mesos-slave-env.sh.template' do
  source 'mesos-slave-env.sh.template.erb'
  variables(
    zookeeper_server_list: zk_server_list,
    zookeeper_port: zk_port,
    zookeeper_path: zk_path,
    logs_dir: node['mesos']['logs_dir'],
    work_dir: node['mesos']['work_dir'],
    isolation_type: node['mesos']['isolation_type'],
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
    action: 'start',
  )
  notifies :run, 'bash[reload-configuration]'
end

bash 'reload-configuration' do
  action :nothing
  user 'root'
  code <<-EOH
  initctl reload-configuration
  EOH
end

bash 'start-mesos-slave' do
  user 'root'
  code <<-EOH
  start mesos-slave
  EOH
  not_if 'status mesos-slave|grep start/running'
end

bash 'restart-mesos-slave' do
  action :nothing
  user 'root'
  code <<-EOH
  restart mesos-slave
  EOH
  not_if 'status mesos-slave|grep stop/waiting'
end
