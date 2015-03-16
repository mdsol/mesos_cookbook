require_relative '../../../kitchen/data/spec_helper'

# mesos slave service
describe 'mesos slave service' do
  it 'should be running' do
    case RSpec.configuration.os
    when 'Debian'
      expect(service 'mesos-slave').to be_running
    end
  end
end

describe port(5051) do
  it { should be_listening }
end

describe command('curl -sD - http://localhost:5051/health -o /dev/null') do
  its(:stdout) { should match(/200 OK/) }
end

describe file('/var/log/mesos/mesos-slave.INFO') do
  its(:content) { should match(/INFO level logging started/) }
  its(:content) { should match(/Slave started on/) }
  its(:content) { should match(/New master detected/) }
end

describe command('curl -sD - http://localhost:5051/state.json') do
  its(:stdout) { should match(/"logging_level":"INFO"/) }
  # check for user defined attributes (exposed twice)
  its(:stdout) { should match(/"attributes"/) }
  its(:stdout) { should match(/"test":"test_value"/) }
  its(:stdout) { should match(/"test:test_value"/) }
  # check for user defined resources
  its(:stdout) { should match(/"resources"/) }
  its(:stdout) { should match(/cpu:24/) }
  its(:stdout) { should match(/ports:\[21000-24000\]/) }
  its(:stdout) { should match(/bugs:{a,b,c}/) }
end
