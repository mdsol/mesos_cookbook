require 'spec_helper'

# verify packages
describe package('unzip') do
  it { should be_installed }
end

describe package('default-jre-headless') do
  it { should be_installed }
end

describe package('libcurl3') do
  it { should be_installed }
end

describe package('mesos') do
  it { should be_installed }
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
