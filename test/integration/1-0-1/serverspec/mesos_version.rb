require 'spec_helper'

describe command('mesos-master --version') do
  its(:stdout) { should match(/mesos 1\.0\.1/) }
end

describe command('mesos-slave --version') do
  its(:stdout) { should match(/mesos 1\.0\.1/) }
end
