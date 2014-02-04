require 'spec_helper'

# mesos master service

describe file('/etc/default/mesos') do
  it { should be_file }
end

describe file('/etc/default/mesos-master') do
  it { should be_file }
end

describe file('/etc/mesos/zk') do
  it { should be_file }
end

describe service('mesos-master') do
  it { should be_running }
end

describe port(5050) do
  it { should be_listening }
end
