default['mesos']['version']                                 = '0.20.1'

default['mesos']['master']['env']['ulimit']                 = '-n 16384'
default['mesos']['master']['env']['logs']                   = '/var/log/mesos'

default['mesos']['master']['flags']['port']                 = 5050
default['mesos']['master']['flags']['logging_level']        = 'INFO'
default['mesos']['master']['flags']['cluster']              = 'MyMesosCluster'
default['mesos']['master']['flags']['zk']                   = '`cat /etc/mesos/zk`'
default['mesos']['master']['flags']['work_dir']             = '/tmp/mesos'
default['mesos']['master']['flags']['quorum']               = 1

default['mesos']['slave']['env']['ulimit']                  = '-n 16384'
default['mesos']['slave']['env']['logs']                    = '/var/log/mesos'

default['mesos']['slave']['flags']['port']                  = 5051
default['mesos']['slave']['flags']['logging_level']         = 'INFO'
default['mesos']['slave']['flags']['work_dir']              = '/tmp/mesos'
default['mesos']['slave']['flags']['isolation']             = 'posix/cpu,posix/mem'
default['mesos']['slave']['flags']['master']                = '`cat /etc/mesos/zk`'
default['mesos']['slave']['flags']['checkpoint']            = true
default['mesos']['slave']['flags']['strict']                = false
default['mesos']['slave']['flags']['recover']               = 'reconnect'

default['mesos']['zookeeper_server_list']                   = []
default['mesos']['zookeeper_port']                          = 2181
default['mesos']['zookeeper_path']                          = 'mesos'
default['mesos']['zookeeper_exhibitor_discovery']           = false
default['mesos']['zookeeper_exhibitor_url']                 = nil
default['mesos']['set_ec2_hostname']                        = true

case node['platform_family']
when 'rhel'
  default['java']['jdk_version'] = '7'
end

include_attribute 'mesos::mesosphere_packages'
include_attribute 'mesos::mesos_options'
