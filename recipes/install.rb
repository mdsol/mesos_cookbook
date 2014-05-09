#
# Cookbook Name:: mesos
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
include_recipe 'java::default'

distro = node['platform']
distro_version = node['platform_version']

case distro
when 'debian', 'ubuntu'
  %w( unzip default-jre-headless libcurl3 ).each do |pkg|
    package pkg do
      action :install
    end
  end

  if distro == 'debian'
    match = distro_version.match(/(\d{1})(\.?\d+)?/i)

    unless match.nil?
      major_version, _minor_version = match.captures
      distro_version = major_version
    end
  elsif distro == 'ubuntu'
    # For now we need to use the latest 13.x based deb
    # package until a trusty mesos deb is available
    # on mesosphere site.
    distro_version = '13.10' if distro_version == '14.04'
  end

  remote_file "#{Chef::Config[:file_cache_path]}/mesos.deb" do
    source "http://downloads.mesosphere.io/master/#{distro}/#{distro_version}/mesos_#{node['mesos']['version']}_amd64.deb"
    action :create
    not_if { ::File.exist? '/usr/local/sbin/mesos-master' }
  end

  dpkg_package 'mesos' do
    source "#{Chef::Config[:file_cache_path]}/mesos.deb"
    not_if { ::File.exist? '/usr/local/sbin/mesos-master' }
  end
when 'rhel', 'centos', 'amazon', 'scientific'
  %w( unzip libcurl ).each do |pkg|
    yum_package pkg do
      action :install
    end
  end

  yum_package 'jdk' do
    action :purge
  end

  execute 'update java alternatives' do
    command '/usr/sbin/alternatives --auto java'
    action :run
  end

  execute 'ldconfig' do
    command '/sbin/ldconfig'
    action :nothing
  end

  file '/etc/ld.so.conf.d/jre.conf' do
    content "#{node['java']['java_home']}/jre/lib/amd64/server"
    notifies :run, 'execute[ldconfig]', :immediately
    mode 0644
  end

  remote_file "#{Chef::Config[:file_cache_path]}/mesos-#{node['mesos']['version']}.rpm" do
    source "http://downloads.mesosphere.io/master/centos/6/mesos_#{node['mesos']['version']}_x86_64.rpm"
    action :create
    not_if { ::File.exist? '/usr/local/sbin/mesos-master' }
  end

  rpm_package 'mesos' do
    source "#{Chef::Config[:file_cache_path]}/mesos-#{node['mesos']['version']}.rpm"
    not_if { ::File.exist? '/usr/local/sbin/mesos-master' }
  end
end

# Set init to 'stop' by default for mesos master.
# Running mesos::master recipe will reset this to 'start'
template '/etc/init/mesos-master.conf' do
  source 'mesos-master.conf.erb'
  variables(
    action: 'stop',
  )
end

# Set init to 'stop' by default for mesos slave.
# Running mesos::slave recipe will reset this to 'start'
template '/etc/init/mesos-slave.conf' do
  source 'mesos-slave.conf.erb'
  variables(
    action: 'stop',
  )
end

if distro == 'debian'
  bash 'reload-configuration-debian' do
    user 'root'
    code <<-EOH
    update-rc.d -f mesos-master remove
    EOH
    not_if { ::File.exist? '/usr/local/sbin/mesos-master' }
  end
else
  bash 'reload-configuration' do
    user 'root'
    code <<-EOH
    initctl reload-configuration
    EOH
    not_if { ::File.exist? '/usr/local/sbin/mesos-master' }
  end
end
