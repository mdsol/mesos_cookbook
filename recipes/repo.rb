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

case node['platform']
when 'debian', 'ubuntu'
  # Add mesosphere deb repository
  apt_repository 'mesosphere' do
    uri "http://repos.mesosphere.io/#{node['platform']}"
    distribution node['lsb']['codename']
    keyserver 'hkp://keyserver.ubuntu.com:80'
    key 'E56151BF'
    components ['main']
  end
when 'rhel', 'redhat', 'centos', 'amazon', 'scientific'
  # Add mesosphere RPM repository
  compile_time do
    remote_file 'mesos-rpm-yum' do
      case node['platform_version'].split('.').first
      when '7'
        source 'http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm'
      when '6'
        source 'http://repos.mesosphere.io/el/6/noarch/RPMS/mesosphere-el-repo-6-2.noarch.rpm'
      end
      path "#{Chef::Config[:file_cache_path]}/mesosphere-el-repo.noarch.rpm"
      action :create
    end

    rpm_package 'mesos-rpm-yum' do
      source "#{Chef::Config[:file_cache_path]}/mesosphere-el-repo.noarch.rpm"
      action :install
    end
  end
end
