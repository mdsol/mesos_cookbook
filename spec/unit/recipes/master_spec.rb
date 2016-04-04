#
# Cookbook Name:: mesos
# Spec:: master
#

require 'spec_helper'

describe 'mesos::master' do
  context 'When all attributes are default, on CentOS 7' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.1.1503')
      runner.converge(described_recipe)
    end
    it 'Includes recipe mesos::install' do
      expect(chef_run).to include_recipe('mesos::install')
    end
    it 'Includes renders template for start script' do
      expect(chef_run).to create_template('/etc/mesos-chef/mesos-master').with(
        owner:  'root',
        group:  'root',
        mode:   '0750',
        source: 'wrapper.erb'
      )
    end
    it 'Starts and enable mesos-master service' do
      expect(chef_run).to start_service('mesos-master')
      expect(chef_run).to enable_service('mesos-master')
    end
    it 'Subscribes the service to mesos-master-init template' do
      service = chef_run.service('mesos-master')
      expect(service).to subscribe_to('template[mesos-master-init]').on(:restart)
    end
    it 'Subscribes the service to mesos-master-wrapper template' do
      service = chef_run.service('mesos-master')
      expect(service).to subscribe_to('template[mesos-master-wrapper]').on(:restart)
    end
  end
end
