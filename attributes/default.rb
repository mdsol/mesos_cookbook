# Mesosphere Mesos version.  The version configured here must exist in
# attributes/mesosphere_packages.rb.
default['mesos']['version']                                 = '0.20.1'

# Configure Mesos master processes via environment variables here.
# NOTE: Any attributes defined under ['mesos']['master']['env'] will be written
# to /etc/default/mesos-master.

# Ulimit to pass to mesos-master process.
default['mesos']['master']['env']['ULIMIT']                 = '-n 16384'

# Directory to write mesos-master logs.
default['mesos']['master']['env']['LOGS']                   = '/var/log/mesos'

# Configure Mesos via command line options here.
# NOTE: Any attributes defined under ['mesos']['master']['flags'] will be
# written as individual files within the directory /etc/mesos-master/.
# Mesos init scripts will then use file in that directory as key/value pairs
# to pass along as command line options to the mesos-master process.

# mesos-master default port
default['mesos']['master']['flags']['port']                 = 5050

# mesos-master default logging level.  Valid options: 'INFO', 'WARNING', 'ERROR']
default['mesos']['master']['flags']['logging_level']        = 'INFO'

# mesos-master cluster name that is visible from UI.
default['mesos']['master']['flags']['cluster']              = 'MyMesosCluster'

# ZooKeeper URL (used for leader election amongst masters).
# In this case we are deferring zk URL to what is in /etc/mesos/zk which this cookbook
# manages based on zookeeper specific attributes below.
default['mesos']['master']['flags']['zk']                   = '`cat /etc/mesos/zk`'

# Where to store the persistent information stored in the Registry.
default['mesos']['master']['flags']['work_dir']             = '/tmp/mesos'

# The size of the quorum of replicas when using 'replicated_log' based registry. It is
# imperative to set this value to be a majority of masters i.e.,
# quorum > (number of masters)/2.
default['mesos']['master']['flags']['quorum']               = 1

# Configure Mesos slaves processes via environment variables here.
# NOTE: Any attributes defined under ['mesos']['slave']['env'] will be written
# to /etc/default/mesos-slave

# Ulimit to pass to mesos-slave process.
default['mesos']['slave']['env']['ULIMIT']                  = '-n 16384'

# Directory to write mesos-slave logs.
default['mesos']['slave']['env']['LOGS']                    = '/var/log/mesos'

# mesos-slave default port
default['mesos']['slave']['flags']['port']                  = 5051

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
default['mesos']['slave']['flags']['master']                = '`cat /etc/mesos/zk`'

# If strict=true, any and all recovery errors are considered fatal.  If strict=false,
# any expected errors (e.g., slave cannot recover information about an executor,
# because the slave died right before the executor registered.) during recovery
# are ignored and as much state as possible is recovered.
default['mesos']['slave']['flags']['strict']                = true

# Whether to recover status updates and reconnect with old executors.
# Valid options: 'reconnect', 'cleanup'.  See Mesos documentation for
# details: http://mesos.apache.org/documentation/latest/configuration
default['mesos']['slave']['flags']['recover']               = 'reconnect'

# List of Zookeeper hostnames or IP addresses to use for managing Mesos.
default['mesos']['zookeeper_server_list']                   = []

# Zookeeper port.
default['mesos']['zookeeper_port']                          = 2181

# Zookeeper path that Mesos will use to write to.
default['mesos']['zookeeper_path']                          = 'mesos'

# Use the following two options if you are using Exhibitor to manage Zookeeper
# in your environment.
#
# Flag to enable Zookeeper ensemble discovery via Netflix Exhibitor.
default['mesos']['zookeeper_exhibitor_discovery']           = false

# Netflix Exhibitor ZooKeeper ensemble url.
default['mesos']['zookeeper_exhibitor_url']                 = nil

# Setting this option to true will update mesos node hostnames to their public
# EC2 hostname.
default['mesos']['set_ec2_hostname']                        = true

case node['platform_family']
when 'rhel'
  default['java']['jdk_version'] = '7'
end

include_attribute 'mesos::mesosphere_packages'
include_attribute 'mesos::mesos_options'
