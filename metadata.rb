name             'mesos'
maintainer       'Medidata Solutions'
maintainer_email 'rarodriguez@mdsol.com'
license          'Apache 2.0'
description      'Installs/Configures mesos'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

%w{ ubuntu }.each do |os|
  supports os
end

# Cookbook dependencies
%w{ zookeeper java apt }.each do |cb|
  depends cb
end
