require_relative '../../../kitchen/data/spec_helper'

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

describe 'mesos master service' do
  it 'should be running' do
    case RSpec.configuration.os
    when 'Debian'
      expect(service 'mesos-master').to be_running
    end
  end
end

describe port(5050) do
  it { should be_listening }
end
