#
# Cookbook Name:: mesos
# Spec:: install
#

require 'spec_helper'

describe 'mesos::install' do
  context 'When all attributes are default, on CentOS 7' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.1.1503')
      runner.converge(described_recipe)
    end
    it 'Includes recipe Java' do
      expect(chef_run).to include_recipe('java')
    end
    it 'Includes recipe mesos::repo' do
      expect(chef_run).to include_recipe('mesos::repo')
    end
    it 'Installs util packages' do
      expect(chef_run).to install_yum_package('unzip')
      expect(chef_run).to install_yum_package('libcurl')
      expect(chef_run).to install_yum_package('subversion')
    end
    it 'Installs mesos' do
      expect(chef_run).to install_yum_package('mesos')
    end
    it 'Creates directory for storing the configuration' do
      expect(chef_run).to create_directory('/etc/mesos-chef')
    end
    it 'Rolls out systemd image for mesos-master' do
      expect(chef_run).to render_file('/etc/systemd/system/mesos-master.service')
    end
    it 'Rolls out systemd image for mesos-slave' do
      expect(chef_run).to render_file('/etc/systemd/system/mesos-slave.service')
    end
    it 'Stop and disable both master and slave services' do
      expect(chef_run).to stop_service('mesos-master')
      expect(chef_run).to disable_service('mesos-master')
      expect(chef_run).to stop_service('mesos-slave')
      expect(chef_run).to disable_service('mesos-slave')
    end
  end
end
