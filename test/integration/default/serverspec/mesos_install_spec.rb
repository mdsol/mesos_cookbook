require_relative '../../../kitchen/data/spec_helper'

# verify packages
describe 'mesos install' do
  it 'should install required packages' do
    case RSpec.configuration.os
    when 'Debian'
      expect(package 'unzip').to be_installed
      expect(package 'default-jre-headless').to be_installed
      expect(package 'libcurl3').to be_installed
      expect(package 'mesos').to be_installed
    when 'RedHat'
      expect(package 'unzip').to be_installed
      expect(package 'libcurl').to be_installed
      expect(package 'mesos').to be_installed
    end
  end
end

describe file('/etc/init/mesos-master.conf') do
  it { should be_file }
end

describe file('/etc/init/mesos-slave.conf') do
  it { should be_file }
end

describe file('/usr/local/sbin/mesos-master') do
  it { should be_file }
end
