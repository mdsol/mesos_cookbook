# Enable default repo
default['mesos']['repo']    = true

# Mesosphere Mesos version.
default['mesos']['version'] = '0.21.1'

# Init system to use
default['mesos']['init']    = case node['platform']
                              when 'debian' then 'sysvinit_debian'
                              else 'upstart'
                              end

#
# Mesos MASTER configuration
#

# Mesos master binary location
if node['mesos']['version'] == '0.21.1' || node['mesos']['version'] == '0.22.0' || node['mesos']['version'] == '0.22.1'
  default['mesos']['master']['bin']                         = '/usr/sbin/mesos-master'
else
  default['mesos']['master']['bin']                         = '/usr/local/sbin/mesos-master'
end

# Ulimit to pass to mesos-master process.
default['mesos']['master']['env']['ULIMIT']                 = '-n 16384'

# mesos-master default port
default['mesos']['master']['flags']['port']                 = 5050

# Directory to write mesos-master logs.
default['mesos']['master']['flags']['log_dir']              = '/var/log/mesos'

# mesos-master default logging level.  Valid options: 'INFO', 'WARNING', 'ERROR']
default['mesos']['master']['flags']['logging_level']        = 'INFO'

# mesos-master cluster name that is visible from UI.
default['mesos']['master']['flags']['cluster']              = 'MyMesosCluster'

# Where to store the persistent information stored in the Registry.
default['mesos']['master']['flags']['work_dir']             = '/tmp/mesos'

#
# Mesos SLAVE configuration
#

# Mesos slave binary location
if node['mesos']['version'] == '0.21.1' || node['mesos']['version'] == '0.22.0' || node['mesos']['version'] == '0.22.1'
  default['mesos']['slave']['bin']                          = '/usr/sbin/mesos-slave'
else
  default['mesos']['slave']['bin']                          = '/usr/local/sbin/mesos-slave'
end

# Ulimit to pass to mesos-slave process.
default['mesos']['slave']['env']['ULIMIT']                  = '-n 16384'

# mesos-slave default port
default['mesos']['slave']['flags']['port']                  = 5051

# Directory to write mesos-master logs.
default['mesos']['slave']['flags']['log_dir']              = '/var/log/mesos'

# mesos-slave default logging level.  Valid options: 'INFO', 'WARNING', 'ERROR']
default['mesos']['slave']['flags']['logging_level']         = 'INFO'

# Where to store the persistent information stored in the Registry.
default['mesos']['slave']['flags']['work_dir']              = '/tmp/mesos'

# Isolation mechanisms to use, e.g., 'posix/cpu,posix/mem', or 'cgroups/cpu,cgroups/mem',
# or network/port_mapping (configure with flag: --with-network-isolator to enable), or
# 'external', or load an alternate isolator module using the --modules flag.
default['mesos']['slave']['flags']['isolation']             = 'posix/cpu,posix/mem'

# This specifies how to connect to a master or a quorum of masters. This flag
# works with 3 different techniques.  See Mesos documentation for details:
# http://mesos.apache.org/documentation/latest/configuration
default['mesos']['slave']['flags']['master']                = 'localhost:5050'

# If strict=true, any and all recovery errors are considered fatal.  If strict=false,
# any expected errors (e.g., slave cannot recover information about an executor,
# because the slave died right before the executor registered.) during recovery
# are ignored and as much state as possible is recovered.
default['mesos']['slave']['flags']['strict']                = true

# Whether to recover status updates and reconnect with old executors.
# Valid options: 'reconnect', 'cleanup'.  See Mesos documentation for
# details: http://mesos.apache.org/documentation/latest/configuration
default['mesos']['slave']['flags']['recover']               = 'reconnect'

# Use the following two options if you are using Exhibitor to manage Zookeeper
# in your environment.

# Zookeeper path that Mesos will use to write to.
default['mesos']['zookeeper_path']                          = 'mesos'

# Flag to enable Zookeeper ensemble discovery via Netflix Exhibitor.
default['mesos']['zookeeper_exhibitor_discovery']           = false

# Netflix Exhibitor ZooKeeper ensemble url.
default['mesos']['zookeeper_exhibitor_url']                 = nil

case node['platform_family']
when 'rhel'
  default['java']['jdk_version'] = '7'
end

include_attribute 'mesos::mesos_options'
