default['mesos']['options'] = {
  'master' => {
    'acls' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'advertise_ip' => {
      'version' => ['0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'advertise_port' => {
      'version' => ['0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'allocation_interval' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '1secs',
      'flag' => false,
      'deprecated' => false
    },
    'allocator' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 'HierarchicalDRF',
      'flag' => false,
      'deprecated' => false
    },
    'authenticate' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => false,
      'flag' => true,
      'deprecated' => false
    },
    'authenticate_slaves' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => false,
      'flag' => true,
      'deprecated' => false
    },
    'authenticators' => {
      'version' => ['0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'authorizers' => {
      'version' => ['0.23.0'],
      'default' => 'local',
      'flag' => false,
      'deprecated' => false
    },
    'cluster' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'credentials' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'external_log_file' => {
      'version' => ['0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'firewall_rules' => {
      'version' => ['0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'framework_sorter' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 'drf',
      'flag' => false,
      'deprecated' => false
    },
    'hooks' => {
      'version' => ['0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'hostname' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'initialize_driver_logging' => {
      'version' => ['0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => true,
      'flag' => true,
      'deprecated' => false
    },
    'ip' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'ip_discovery_command' => {
      'version' => ['0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'log_auto_initialize' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => true,
      'flag' => true,
      'deprecated' => false
    },
    'log_dir' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '/var/log/mesos',
      'flag' => false,
      'deprecated' => false
    },
    'logbufsecs' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 0,
      'flag' => false,
      'deprecated' => false
    },
    'logging_level' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 'INFO',
      'flag' => false,
      'deprecated' => false
    },
    'max_slave_ping_timeouts' => {
      'version' => ['0.23.0'],
      'default' => 5,
      'flag' => false,
      'deprecated' => false
    },
    'max_executors_per_slave' => {
      'version' => ['0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'modules' => {
      'version' => ['0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'offer_timeout' => {
      'version' => ['0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'port' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '5050',
      'flag' => false,
      'deprecated' => false
    },
    'quiet' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => false,
      'flag' => true,
      'deprecated' => false
    },
    'quorum' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 1,
      'flag' => false,
      'deprecated' => false
    },
    'rate_limits' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'recovery_slave_removal_limit' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '100%',
      'flag' => false,
      'deprecated' => false
    },
    'registry' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 'replicated_log',
      'flag' => false,
      'deprecated' => false
    },
    'registry_fetch_timeout' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '1mins',
      'flag' => false,
      'deprecated' => false
    },
    'registry_store_timeout' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '5secs',
      'flag' => false,
      'deprecated' => false
    },
    'registry_strict' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => false,
      'flag' => true,
      'deprecated' => false
    },
    'roles' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'root_submissions' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => true,
      'flag' => true,
      'deprecated' => false
    },
    'slave_ping_timeout' => {
      'version' => ['0.23.0'],
      'default' => '15secs',
      'flag' => false,
      'deprecated' => false
    },
    'slave_removal_rate_limit' => {
      'version' => ['0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'slave_register_timeout' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '10mins',
      'flag' => false,
      'deprecated' => false
    },
    'user_sorter' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 'drf',
      'flag' => false,
      'deprecated' => false
    },
    'webui_dir' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '/usr/local/share/mesos/webui',
      'flag' => false,
      'deprecated' => false
    },
    'weights' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'whitelist' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '*',
      'flag' => false,
      'deprecated' => false
    },
    'work_dir' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'zk' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'zk_session_timeout' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '10secs',
      'flag' => false,
      'deprecated' => false
    }
  },
  'slave' => {
    'attributes' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'authenticatee' => {
      'version' => ['0.22.0', '0.22.1', '0.23.0'],
      'default' => 'crammd5',
      'flag' => false,
      'deprecated' => false
    },
    'cgroups_cpu_enable_pids_and_tids_count' => {
      'version' => ['0.23.0'],
      'default' => false,
      'flag' => true,
      'deprecated' => false
    },
    'cgroups_enable_cfs' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => false,
      'flag' => true,
      'deprecated' => false
    },
    'cgroups_hierarchy' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '/sys/fs/cgroup',
      'flag' => false,
      'deprecated' => false
    },
    'cgroups_limit_swap' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => false,
      'flag' => true,
      'deprecated' => false
    },
    'cgroups_root' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 'mesos',
      'flag' => false,
      'deprecated' => false
    },
    'container_disk_watch_interval' => {
      'version' => ['0.22.0', '0.22.1', '0.23.0'],
      'default' => 'mesos',
      'flag' => false,
      'deprecated' => false
    },
    'cgroups_subsystems' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1'],
      'default' => '',
      'flag' => false,
      'deprecated' => true
    },
    'checkpoint' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1'],
      'default' => true,
      'flag' => true,
      'deprecated' => true
    },
    'containerizer_path' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'containerizers' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 'mesos',
      'flag' => false,
      'deprecated' => false
    },
    'credential' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'default_container_image' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'default_container_info' => {
      'version' => ['0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'network_enable_socket_statistics' => {
      'version' => ['0.21.0', '0.21.1', '0.22.0', '0.22.1'],
      'default' => false,
      'flag' => true,
      'deprecated' => true
    },
    'default_role' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '*',
      'flag' => false,
      'deprecated' => false
    },
    'disk_watch_interval' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '1mins',
      'flag' => false,
      'deprecated' => false
    },
    'docker' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 'docker',
      'flag' => false,
      'deprecated' => false
    },
    'docker_remove_delay' => {
      'version' => ['0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '6hrs',
      'flag' => false,
      'deprecated' => false
    },
    'docker_kill_orphans' => {
      'version' => ['0.23.0'],
      'default' => true,
      'flag' => true,
      'deprecated' => false
    },
    'docker_sandbox_directory' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1'],
      'default' => '/mnt/mesos/sandbox',
      'flag' => false,
      'deprecated' => true
    },
    'docker_stop_timeout' => {
      'version' => ['0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '0secs',
      'flag' => false,
      'deprecated' => false
    },
    'egress_limit_per_container' => {
      'version' => ['0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'enforce_container_disk_quota' => {
      'version' => ['0.22.0', '0.22.1'],
      'default' => false,
      'flag' => true,
      'deprecated' => false
    },
    'ephemeral_ports_per_container' => {
      'version' => ['0.23.0'],
      'default' => 1024,
      'flag' => false,
      'deprecated' => false
    },
    'eth0_name' => {
      'version' => ['0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'executor_environment_variables' => {
      'version' => ['0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'executor_registration_timeout' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '1mins',
      'flag' => false,
      'deprecated' => false
    },
    'executor_shutdown_grace_period' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '5secs',
      'flag' => false,
      'deprecated' => false
    },
    'external_log_file' => {
      'version' => ['0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'frameworks_home' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'gc_delay' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '1weeks',
      'flag' => false,
      'deprecated' => false
    },
    'gc_disk_headroom' => {
      'version' => ['0.22.0', '0.22.1', '0.23.0'],
      'default' => '0.1',
      'flag' => false,
      'deprecated' => false
    },
    'hadoop_home' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'hooks' => {
      'version' => ['0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'hostname' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'initialize_driver_logging' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => true,
      'flag' => true,
      'deprecated' => false
    },
    'ip' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'ip_discovery_command' => {
      'version' => ['0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'isolation' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 'posix/cpu,posix/mem',
      'flag' => false,
      'deprecated' => false
    },
    'launcher_dir' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '/usr/libexec/mesos',
      'flag' => false,
      'deprecated' => false
    },
    'lo_name' => {
      'version' => ['0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'log_dir' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '/var/log/mesos',
      'flag' => false,
      'deprecated' => false
    },
    'logbufsecs' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '0',
      'flag' => false,
      'deprecated' => false
    },
    'logging_level' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 'INFO',
      'flag' => false,
      'deprecated' => false
    },
    'master' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'modules' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'oversubscribed_resources_interval' => {
      'version' => ['0.23.0'],
      'default' => '15secs',
      'flag' => false,
      'deprecated' => false
    },
    'perf_duration' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '10secs',
      'flag' => false,
      'deprecated' => false
    },
    'perf_events' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'perf_interval' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '1mins',
      'flag' => false,
      'deprecated' => false
    },
    'port' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '5051',
      'flag' => false,
      'deprecated' => false
    },
    'qos_controller' => {
      'version' => ['0.23.0'],
      'default' => false,
      'flag' => false,
      'deprecated' => false
    },
    'qos_correction_interval_min' => {
      'version' => ['0.23.0'],
      'default' => '0secs',
      'flag' => false,
      'deprecated' => false
    },
    'quiet' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => false,
      'flag' => true,
      'deprecated' => false
    },
    'recover' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => 'reconnect',
      'flag' => false,
      'deprecated' => false
    },
    'recovery_timeout' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '15mins',
      'flag' => false,
      'deprecated' => false
    },
    'registration_backoff_factor' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '1secs',
      'flag' => false,
      'deprecated' => false
    },
    'reseource_estimator' => {
      'version' => ['0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'resource_monitoring_interval' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '1secs',
      'flag' => false,
      'deprecated' => false
    },
    'resources' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'revocable_cpu_low_priority' => {
      'version' => ['0.23.0'],
      'default' => true,
      'flag' => true,
      'deprecated' => false
    },
    'sandbox_directory' => {
      'version' => ['0.23.0'],
      'default' => '/mnt/mesos/sandbox',
      'flag' => false,
      'deprecated' => false
    },
    'slave_subsystems' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '',
      'flag' => false,
      'deprecated' => false
    },
    'strict' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => true,
      'flag' => true,
      'deprecated' => false
    },
    'switch_user' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => true,
      'flag' => true,
      'deprecated' => false
    },
    'work_dir' => {
      'version' => ['0.20.0', '0.20.1', '0.21.0', '0.21.1', '0.22.0', '0.22.1', '0.23.0'],
      'default' => '/tmp/mesos',
      'flag' => false,
      'deprecated' => false
    }
  }
}
