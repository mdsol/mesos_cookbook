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

# Mesos configuration validation
ruby_block 'mesos-master-configuration-validation' do
  block do
    # Get Mesos --help
    help = Mixlib::ShellOut.new("#{node['mesos']['master']['bin']} --help")
    help.run_command
    help.error!
    # Extract options
    options = help.stdout.strip.scan(/^  --(?:\[no-\])?(\w+)/).flatten - ['help']
    # Check flags are in the list
    node['mesos']['master']['flags'].keys.each do |flag|
      unless options.include?(flag)
        Chef::Application.fatal!("Invalid Mesos configuration option: #{flag}. Aborting!", 1000)
      end
    end
  end
end

# ZooKeeper Exhibitor discovery
if node['mesos']['zookeeper_exhibitor_discovery'] && node['mesos']['zookeeper_exhibitor_url']
  zk_nodes = MesosHelper.discover_zookeepers_with_retry(node['mesos']['zookeeper_exhibitor_url'])

  if zk_nodes.nil?
    Chef::Application.fatal!('Failed to discover zookeepers. Cannot continue.')
  end

  node.override['mesos']['master']['flags']['zk'] = 'zk://' + zk_nodes['servers'].sort.map { |s| "#{s}:#{zk_nodes['port']}" }.join(',') + '/' + node['mesos']['zookeeper_path']
end

# Mesos master configuration wrapper
template 'mesos-master-wrapper' do
  path '/etc/mesos-chef/mesos-master'
  owner 'root'
  group 'root'
  mode '0755'
  source 'wrapper.erb'
  variables(env:    node['mesos']['master']['env'],
            bin:    node['mesos']['master']['bin'],
            flags:  node['mesos']['master']['flags'],
            syslog: node['mesos']['master']['syslog'])
end

# Mesos master service definition
service 'mesos-master' do
  case node['mesos']['init']
  when 'systemd'
    provider Chef::Provider::Service::Systemd
  when 'sysvinit_debian'
    provider Chef::Provider::Service::Init::Debian
  when 'upstart'
    provider Chef::Provider::Service::Upstart
  end
  supports status: true, restart: true
  subscribes :restart, 'template[mesos-master-init]'
  subscribes :restart, 'template[mesos-master-wrapper]'
  action [:enable, :start]
end
