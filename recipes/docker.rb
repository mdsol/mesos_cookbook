#
# Cookbook Name:: mesos
# Recipe:: docker
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
include_recipe 'docker'
include_recipe 'mesos::slave'

package 'python-setuptools'

directory '/var/lib/mesos/executors' do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

remote_file '/var/lib/mesos/executors/docker' do
  owner 'root'
  group 'root'
  source 'https://raw.github.com/mesosphere/mesos-docker/master/bin/mesos-docker'
  mode 00755
  not_if { ::File.exists?('/var/lib/mesos/executors/docker') }
end

remote_file "#{Chef::Config[:file_cache_path]}/mesos.egg" do
  owner 'root'
  group 'root'
  source node['mesos']['python_egg']
  mode 00755
  not_if { ::File.exists?("#{Chef::Config[:file_cache_path]}/mesos.egg") }
end

bash 'install-mesos-egg' do
  user 'root'
  group 'root'
  code <<-EOH
    easy_install "#{Chef::Config[:file_cache_path]}/mesos.egg"
  EOH
  not_if { ::File.exists?('/usr/local/lib/python2.7/dist-packages/mesos.egg') }
end
