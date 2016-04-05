#
# Cookbook Name:: mesos
# Spec:: slave
#

require 'spec_helper'

describe 'mesos::slave' do
  context 'When all attributes are default, on CentOS 7' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.1.1503')
      runner.converge(described_recipe)
    end
    it 'Includes recipe mesos::install' do
      expect(chef_run).to include_recipe('mesos::install')
    end
    it 'Creates deploy directory' do
      expect(chef_run).to create_directory('/usr/local/var/mesos/deploy/')
    end
    it 'Includes renders template for start script' do
      expect(chef_run).to create_template('/etc/mesos-chef/mesos-slave').with(
        owner:  'root',
        group:  'root',
        mode:   '0750',
        source: 'wrapper.erb'
      )
    end
    it 'Starts and enable mesos-slave service' do
      expect(chef_run).to start_service('mesos-slave')
      expect(chef_run).to enable_service('mesos-slave')
    end
    it 'Subscribes the service to mesos-slave-init template' do
      service = chef_run.service('mesos-slave')
      expect(service).to subscribe_to('template[mesos-slave-init]').on(:restart)
    end
    it 'Subscribes the service to mesos-slave-wrapper template' do
      service = chef_run.service('mesos-slave')
      expect(service).to subscribe_to('template[mesos-slave-wrapper]').on(:restart)
    end
  end
end
