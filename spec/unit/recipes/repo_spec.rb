#
# Cookbook Name:: mesos
# Spec:: repo
#

require 'spec_helper'

describe 'mesos::install' do
  context 'When all attributes are default, on CentOS 7' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.1.1503')
      runner.converge(described_recipe)
    end
    it 'Includes mesosphere repo' do
      expect(chef_run).to create_yum_repository('mesosphere')
    end
  end
end
