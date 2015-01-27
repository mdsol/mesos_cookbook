default['mesos']['version']                       = '0.17.0'
default['mesos']['common']['port']                = 5050
default['mesos']['common']['logs_dir']            = '/var/log/mesos'
default['mesos']['common']['logging_level']       = 'ERROR'
default['mesos']['common']['ulimit']              = '-n 16384'
default['mesos']['master']['cluster']             = 'MyMesosCluster'
default['mesos']['master']['zk']                  = '`cat /etc/mesos/zk`'
default['mesos']['slave']['work_dir']             = '/tmp/mesos'
default['mesos']['slave']['isolation']            = 'process'
default['mesos']['slave']['master']               = '`cat /etc/mesos/zk`'
default['mesos']['zookeeper_server_list']         = []
default['mesos']['zookeeper_port']                = 2181
default['mesos']['zookeeper_path']                = 'mesos'
default['mesos']['zookeeper_exhibitor_discovery'] = false
default['mesos']['zookeeper_exhibitor_url']       = nil
default['mesos']['set_ec2_hostname']              = true
default['mesos']['python_egg']                    = 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos-0.14.0-py2.7-linux-x86_64.egg'
# attributes under default['mesos']['slave'] are written to /etc/mesos-slave/$key = $value
default['mesos']['slave']['checkpoint']           = 'true'
default['mesos']['slave']['strict']               = 'false'
default['mesos']['slave']['recover']              = 'reconnect'

case node['platform_family']
when 'rhel'
  default['java']['jdk_version'] = '7'
end
