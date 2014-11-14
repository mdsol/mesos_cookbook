#
# This recipe installs a local zookeeper server using the zookeeper and
# zookeeper-server yum packages.
#

include_recipe 'java'

# Add clouder cdh4 repository for testing with a running local zookeeper
bash 'install-cdh4-repo' do
  user 'root'
  code <<-EOH
  wget http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm
  yum -y --nogpgcheck localinstall cloudera-cdh-4-0.x86_64.rpm
  EOH
  not_if { ::File.directory? '/var/lib/zookeeper' }
end

package 'zookeeper-server' do
  action :install
end

bash 'initialize-zookeeper' do
  user 'root'
  code <<-EOH
  service zookeeper-server init
  EOH
  not_if('ps aux | grep -v grep | grep zookeeper')
end

bash 'start-zookeeper' do
  user 'root'
  code <<-EOH
  service zookeeper-server start
  EOH
  not_if('ps aux | grep -v grep | grep zookeeper')
end
