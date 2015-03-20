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

if node['mesos']['zookeeper_exhibitor_discovery'] && node['mesos']['zookeeper_exhibitor_url']
  zk_nodes = MesosHelper.discover_zookeepers_with_retry(node['mesos']['zookeeper_exhibitor_url'])
  default['mesos']['slave']['master'] = 'zk://' + zk_nodes['servers'].map { |s| "#{s}:#{zk_nodes['port']}" }.join(',') + '/' +  node['mesos']['zookeeper_path']
end

# this directory doesn't exist on newer versions of Mesos, i.e. 0.21.0+
directory '/usr/local/var/mesos/deploy/' do
  recursive true
end

# mesos-slave configuration wrapper
template '/etc/mesos-chef/mesos-slave' do
  owner 'root'
  group 'root'
  mode '0755'
  source 'wrapper.erb'
  variables(env:   node['mesos']['slave']['env'],
            bin:   '/usr/local/sbin/mesos-slave',
            flags: node['mesos']['slave']['flags'])
  notifies :run, 'bash[reload-configuration]'
end

# Set init to 'start' by default for mesos slave.
# This ensures that mesos-slave is started on restart
template '/etc/init/mesos-slave.conf' do
  source 'upstart.erb'
  variables(
    wrapper: '/etc/mesos-chef/mesos-slave',
    action:  'start'
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
