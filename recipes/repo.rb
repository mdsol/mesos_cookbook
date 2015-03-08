#
# Cookbook Name:: mesos
# Recipe:: repo
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

include_recipe 'apt' if debian?
include_recipe 'yum' if rhel?

distro = node['platform']
distro_version = node['platform_version']

case distro
when 'debian', 'ubuntu'
  # Add mesosphere deb repository
  apt_repository 'mesosphere' do
    uri "http://repos.mesosphere.io/#{node['platform']}"
    distribution node['lsb']['codename']
    keyserver 'keyserver.ubuntu.com'
    key 'E56151BF'
    components ['main']
  end
when 'rhel', 'redhat', 'centos', 'amazon', 'scientific'
  # Add mesosphere RPM repository
  if distro_version.start_with?('6')
    compile_time do
      remote_file "#{Chef::Config[:file_cache_path]}/mesosphere-el-repo-6-2.noarch.rpm" do
        source 'http://repos.mesosphere.io/el/6/noarch/RPMS/mesosphere-el-repo-6-2.noarch.rpm'
        action :create
      end

      rpm_package 'mesosphere-el-repo-6-2' do
        source "#{Chef::Config[:file_cache_path]}/mesosphere-el-repo-6-2.noarch.rpm"
        action :install
      end
    end
  elsif distro_version.start_with?('7')
    compile_time do
      remote_file "#{Chef::Config[:file_cache_path]}/mesosphere-el-repo-7-1.noarch.rpm" do
        source 'http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm'
        action :create
      end

      rpm_package 'mesosphere-el-repo-7-1' do
        source "#{Chef::Config[:file_cache_path]}/mesosphere-el-repo-7-1.noarch.rpm"
        action :install
      end
    end
  end
end
