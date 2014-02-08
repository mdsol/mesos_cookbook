name             'mesos'
maintainer       'Medidata Solutions'
maintainer_email 'rarodriguez@mdsol.com'
license          'Apache 2.0'
description      'Installs/Configures Apache Mesos'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.4'

%w{ ubuntu centos amazon scientific }.each do |os|
  supports os
end

# Cookbook dependencies
%w{ zookeeper java apt docker }.each do |cb|
  depends cb
end

depends 'yum', '~> 3.0'
