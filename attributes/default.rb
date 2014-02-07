default['mesos']['version']                       = '0.15.0'
default['mesos']['cluster_name']                  = 'MyMesosCluster'
default['mesos']['port']                          = 5050
default['mesos']['logs_dir']                      = '/var/log/mesos'
default['mesos']['work_dir']                      = '/tmp/mesos'
default['mesos']['isolation_type']                = 'process'
default['mesos']['zookeeper_server_list']         = []
default['mesos']['zookeeper_port']                = 2181
default['mesos']['zookeeper_path']                = 'mesos'
default['mesos']['zookeeper_exhibitor_discovery'] = false
default['mesos']['zookeeper_exhibitor_url']       = nil
default['mesos']['set_ec2_hostname']              = true
default['mesos']['python_egg']                    = 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos-0.14.0-py2.7-linux-x86_64.egg'

case node['platform_family']
when 'rhel'
  default['java']['jdk_version'] = '7'
end
