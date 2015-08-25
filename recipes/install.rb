#
# Cookbook Name:: mesos
# Recipe:: install
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

include_recipe 'chef-sugar'
include_recipe 'java::default'

#
# Install default repos
#

include_recipe 'mesos::repo' if node['mesos']['repo']

#
# Install package
#

case node['platform']
when 'debian', 'ubuntu'
  %w( unzip default-jre-headless libcurl3 libsvn1).each do |pkg|
    package pkg do
      action :install
    end
  end

  package 'mesos' do
    action :install
    # --no-install-recommends to skip installing zk. unnecessary.
    options '--no-install-recommends'
    # Glob is necessary to select the deb version string
    version "#{node['mesos']['version']}*"
  end
when 'rhel', 'redhat', 'centos', 'amazon', 'scientific'
  at_compile_time do
    package 'yum-utils'
  end

  %w( unzip libcurl subversion ).each do |pkg|
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

  # get the version-release string via repoquery
  cmd = Mixlib::ShellOut.new("repoquery --queryformat '%{VERSION}-%{RELEASE}' -q mesos-#{node['mesos']['version']}*")
  cmd.run_command
  cmd.error!
  rpm_version = cmd.stdout.strip

  yum_package 'mesos' do
    version rpm_version
    not_if { ::File.exist? '/usr/local/sbin/mesos-master' }
  end
end

#
# Support for multiple init systems
#

directory '/etc/mesos-chef'

# Init templates
template 'mesos-master-init' do
  case node['mesos']['init']
  when 'sysvinit_debian'
    path '/etc/init.d/mesos-master'
    source 'sysvinit_debian.erb'
  when 'upstart'
    path '/etc/init/mesos-master.conf'
    source 'upstart.erb'
  end
  variables(name:    'mesos-master',
            wrapper: '/etc/mesos-chef/mesos-master')
end

template 'mesos-slave-init' do
  case node['mesos']['init']
  when 'sysvinit_debian'
    path '/etc/init.d/mesos-slave'
    source 'sysvinit_debian.erb'
  when 'upstart'
    path '/etc/init/mesos-slave.conf'
    source 'upstart.erb'
  end
  variables(name:    'mesos-slave',
            wrapper: '/etc/mesos-chef/mesos-slave')
end

# Disable services by default
service 'mesos-master-default' do
  case node['mesos']['init']
  when 'sysvinit_debian'
    provider Chef::Provider::Service::Init::Debian
  when 'upstart'
    provider Chef::Provider::Service::Upstart
  end
  action [:stop, :disable]
  not_if { node['recipes'].include?('mesos::master') }
end

service 'mesos-slave-default' do
  case node['mesos']['init']
  when 'sysvinit_debian'
    provider Chef::Provider::Service::Init::Debian
  when 'upstart'
    provider Chef::Provider::Service::Upstart
  end
  action [:stop, :disable]
  not_if { node['recipes'].include?('mesos::slave') }
end
