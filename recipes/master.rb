#
# Cookbook Name:: mesos
# Recipe:: master
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
zookeeper_url_list = []

if node['mesos']['zookeeper_server_list'].count > 0
  zk_server_list = node['mesos']['zookeeper_server_list']
  zk_port = node['mesos']['zookeeper_port']
  zk_path = node['mesos']['zookeeper_path']
end

if node['mesos']['zookeeper_exhibitor_discovery'] && !node['mesos']['zookeeper_exhibitor_url'].nil?
  zk_nodes = discover_zookeepers(node['mesos']['zookeeper_exhibitor_url'])

  zk_server_list = zk_nodes['servers']
  zk_port = zk_nodes['port']
  zk_path = node['mesos']['zookeeper_path']
end

Chef::Log.info("Zookeeper Server List: #{zk_server_list}")
Chef::Log.info("Zookeeper Port: #{zk_port}")
Chef::Log.info("Zookeeper Path: #{zk_path}")

template '/etc/mesos/zk' do
  source 'zk.erb'
  variables(
    :zookeeper_server_list => zk_server_list,
    :zookeeper_port => zk_port,
    :zookeeper_path => zk_path
  )
  notifies :run, "bash[restart-mesos]"
end

bash 'start-mesos' do
  user 'root'
  code <<-EOH
  start mesos-master
  EOH
  not_if 'status mesos-master|grep start/running'
end

bash 'restart-mesos' do
  action :nothing
  user 'root'
  code <<-EOH
  restart mesos-master
  EOH
end
