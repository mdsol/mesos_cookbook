require 'spec_helper'

# mesos slave service

describe file('/etc/default/mesos') do
  it { should be_file }
end

describe file('/etc/default/mesos-slave') do
  it { should be_file }
end

describe file('/etc/mesos/zk') do
  it { should be_file }
end

describe service('mesos-slave') do
  it { should be_running }
end

describe port(5051) do
  it { should be_listening }
end
