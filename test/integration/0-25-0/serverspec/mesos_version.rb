require 'spec_helper'

describe command('mesos-master --version') do
  its(:stdout) { should match(/mesos 0\.25\.0/) }
end

describe command('mesos-slave --version') do
  its(:stdout) { should match(/mesos 0\.25\.0/) }
end
