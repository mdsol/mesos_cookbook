#
# Cookbook Name:: mesosphere_mesos
# Recipe:: install
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

include_recipe 'apt'

distro_version = node['platform_version']

%w{ unzip default-jre-headless libcurl3 }.each do |pkg|
  package pkg do
    action :install
  end
end

remote_file "#{Chef::Config[:file_cache_path]}/mesos.deb" do
  source "http://downloads.mesosphere.io/master/ubuntu/#{distro_version}/mesos_#{node['mesos']['version']}_amd64.deb"
  action :create
  not_if { ::File.exists? "/usr/local/sbin/mesos-master" }
end

dpkg_package "mesos" do
  source "#{Chef::Config[:file_cache_path]}/mesos.deb"
  not_if { ::File.exists? "/usr/local/sbin/mesos-master" }
end

bash "reload-configuration" do
  user "root"
  code <<-EOH
  initctl reload-configuration
  EOH
  not_if { ::File.exists? "/usr/local/sbin/mesos-master" }
end

