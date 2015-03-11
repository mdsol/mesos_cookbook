# rubocop:disable Style/SingleSpaceBeforeFirstArg
name 'mesos'
maintainer 'Medidata Solutions'
maintainer_email 'hwilkinson@mdsol.com'
license 'Apache 2.0'
description 'Installs/Configures Apache Mesos'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.1.0'
# rubocop:enable Style/SingleSpaceBeforeFirstArg

%w( ubuntu debian centos amazon scientific ).each do |os|
  supports os
end

# Cookbook dependencies
%w( java apt docker chef-sugar ).each do |cb|
  depends cb
end

depends 'yum', '~> 3.0'

recommends 'exhibitor', '0.4.0'
