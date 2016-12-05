name             'mesos'
maintainer       'Ray Rodriguez'
maintainer_email 'rayrod2030@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures Apache Mesos'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.6.0'
source_url       'https://github.com/mdsol/mesos_cookbook'
issues_url       'https://github.com/mdsol/mesos_cookbook/issues'

%w(ubuntu debian centos amazon scientific oracle).each do |os|
  supports os
end

%w(java apt yum).each do |cookbook|
  depends cookbook
end
