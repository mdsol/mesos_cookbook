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

include_recipe 'java'

#
# Install default repos
#

include_recipe 'mesos::repo' if node['mesos']['repo']

#
# Install package
#

case node['platform_family']
when 'debian'
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
when 'rhel'
  %w( unzip libcurl subversion ).each do |pkg|
    yum_package pkg do
      action :install
    end
  end

  yum_package 'mesos' do
    version lazy {
      # get the version-release string directly from the Yum provider rpmdb
      Chef::Provider::Package::Yum::YumCache.instance
        .instance_variable_get('@rpmdb').lookup('mesos')
        .find { |pkg| pkg.version.v == node['mesos']['version'] }
        .version.to_s
    }
  end
end

#
# Support for multiple init systems
#

directory '/etc/mesos-chef'

# Init templates
template 'mesos-master-init' do
  case node['mesos']['init']
  when 'systemd'
    path '/etc/systemd/system/mesos-master.service'
    source 'systemd.erb'
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
  when 'systemd'
    path '/etc/systemd/system/mesos-slave.service'
    source 'systemd.erb'
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

# Reload systemd on template change
execute 'systemctl-daemon-reload' do
  command '/bin/systemctl --system daemon-reload'
  subscribes :run, 'template[mesos-master-init]'
  subscribes :run, 'template[mesos-slave-init]'
  action :nothing
  only_if { node['mesos']['init'] == 'systemd' }
end

# Disable services by default
service 'mesos-master-default' do
  service_name 'mesos-master'
  case node['mesos']['init']
  when 'systemd'
    provider Chef::Provider::Service::Systemd
  when 'sysvinit_debian'
    provider Chef::Provider::Service::Init::Debian
  when 'upstart'
    provider Chef::Provider::Service::Upstart
  end
  action [:stop, :disable]
  not_if { node['recipes'].include?('mesos::master') }
end

service 'mesos-slave-default' do
  service_name 'mesos-slave'
  case node['mesos']['init']
  when 'systemd'
    provider Chef::Provider::Service::Systemd
  when 'sysvinit_debian'
    provider Chef::Provider::Service::Init::Debian
  when 'upstart'
    provider Chef::Provider::Service::Upstart
  end
  action [:stop, :disable]
  not_if { node['recipes'].include?('mesos::slave') }
end
