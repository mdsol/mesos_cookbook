Description
===========

Application cookbook for installing the [Apache Mesos][] cluster manager.
Mesos provides efficient resource isolation and sharing across distributed 
applications, or frameworks.

Requirements
============

Chef 11.4.0+

This cookbook assumes you will be running a zookeeper ensemble for production 
use of Mesos.

The following cookbooks are dependencies:

* apt
* java
* zookeeper (used for discovering zookeeper ensembles via [Netflix Exhibitor][])

## Platform:

Tested on

* Ubuntu 12.04

This cookbook includes cross-platform testing support via `test-kitchen`, see `TESTING.md`.


Attributes
==========

* `node['mesos']['version']` - Mesosphere Mesos package version. Default: '0.14.0'.
* `node['mesos']['cluster_name']` - Human readable name for the cluster, displayed in the 
webui. Default: 'MyMesosCluster'.
* `node['mesos']['port']` - Port to listen on. Default: 5050.
* `node['mesos']['logs_dir']` - Location to put log files. Default: '/var/log/mesos'.
* `node['mesos']['enable_master']` - Flag to enable a Mesos master. Default: true.
* `node['mesos']['enable_slave']` - Flag to enable a Mesos slave. Default: true.
* `node['mesos']['work_dir']` - Where to place framework work directories. Default: 
'/tmp/mesos'
* `node['mesos']['isolation_type']` - Isolation mechanism, may be one of: process, cgroups. 
Default: 'process'.
* `node['mesos']['zookeeper_server_list']` - List of zookeeper hostnames or IP addresses. Default: [].
* `node['mesos']['zookeeper_port']` - Zookeeper port. Default: 2181.
* `node['mesos']['zookeeper_path']` - Zookeeper path. Default: 'mesos'.
* `node['mesos']['zookeeper_exhibitor_discovery']` - Flag to enable zookeeper ensemble discovery via Netflix Exhibitor. Default: false.
* `node['mesos']['zookeeper_exhibitor_url']` - Netflix Exhibitor zookeeper ensemble url.


## Usage

Here is a sample role for configuring a Mesos master in a zookeeper backed production mode.

```YAML
chef_type:           role
default_attributes:
description:
env_run_lists:
json_class:          Chef::Role
name:                mesos
override_attributes:
  mesos:
    version: 0.14.0
    cluster_name: mesos-sandbox
    master: true,
    slave: false,
    zookeeper_server_list: [ '203.0.113.2', '203.0.113.3', '203.0.113.4' ]
    zookeeper_port: 2181
    zookeeper_path: 'mesos-sandbox'
run_list:
  recipe[mesos]
```

Here is a sample role for creating a Mesos slave node with a seperate zookeeper ensemble
dynamically discovered via Netflix Exhibitor:
```YAML
chef_type:           role
default_attributes:
description:
env_run_lists:
json_class:          Chef::Role
name:                mesos
override_attributes:
  mesos:
    version: 0.14.0
    cluster_name: mesos-sandbox
    master: false,
    slave: true,
    zookeeper_path: 'mesos'
    zookeeper_exhibitor_discovery: true
    zookeeper_exhibitor_url: 'http://zk-exhibitor-endpoint.example.com:8080'
run_list:
  recipe[mesos]
```

[Apache Mesos]: http://http://mesos.apache.org
[Netflix Exhibitor]: https://github.com/Netflix/exhibitor

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## Author

* Author: [Ray Rodriguez](https://github.com/rayrod2030)
