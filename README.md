Description
===========

Application cookbook for installing the [Apache Mesos][] cluster manager.
Mesos provides efficient resource isolation and sharing across distributed 
applications, or frameworks.  This cookbook installs Mesos via packages
provided by [Mesosphere][].

Requirements
============

Chef 11.4.0+

This cookbook assumes you will be running a ZooKeeper ensemble for production 
use of Mesos.

The following cookbooks are dependencies:

* apt
* java
* zookeeper (used for discovering ZooKeeper ensembles via [Netflix Exhibitor][])
* docker

## Platform:

Tested on

* Ubuntu 12.04
* Ubuntu 13.04

I intend to release updates to this cookbook to support rhel and centos 6.

This cookbook includes cross-platform testing support via `test-kitchen`, see 
`TESTING.md`.


## Attributes

* `node['mesos']['version']` - Mesosphere Mesos package version. Default: 
'0.14.0-rc4'.
* `node['mesos']['cluster_name']` - Human readable name for the cluster, 
displayed in the webui. Default: 'MyMesosCluster'.
* `node['mesos']['port']` - Port to listen on. Default: 5050.
* `node['mesos']['logs_dir']` - Location to put log files. Default: 
'/var/log/mesos'.
* `node['mesos']['work_dir']` - Where to place framework work directories. 
Default: '/tmp/mesos'
* `node['mesos']['isolation_type']` - Isolation mechanism, may be one of: 
process, cgroups. Default: 'process'.
* `node['mesos']['zookeeper_server_list']` - List of ZooKeeper hostnames or 
IP addresses. Default: [].
* `node['mesos']['zookeeper_port']` - ZooKeeper port. Default: 2181.
* `node['mesos']['zookeeper_path']` - ZooKeeper path. Default: 'mesos'.
* `node['mesos']['zookeeper_exhibitor_discovery']` - Flag to enable ZooKeeper 
ensemble discovery via Netflix Exhibitor. Default: false.
* `node['mesos']['zookeeper_exhibitor_url']` - Netflix Exhibitor ZooKeeper 
ensemble url.

## Recipes

### default
The default mesosphere_mesos recipe will run mesosphere_mesos::install.

### install
The install recipe pulls down the specified version of the mesosphere mesos 
package and installs it.  It also configures to stop both mesos-master and 
mesos-slave init files so that they don't automatically start on server 
restart.

### master
The master recipe runs mesosphere_mesos::install as well as creating several
mesos-master configuration files that are used at startup.  This recipe also
uses the zookeeper attributes and/or exhibitor attributes to configure the 
mesos-master using zookeeper.  Lastly it sets the mesos-master init config to
'start' so that mesos-master is started on server restart.

### slave
The slave recipe runs mesosphere_mesos::install as well as creating several
mesos-slave configuration files that are used at startup.  This recipe also
uses the zookeeper attributes and/or exhibitor attributes to configure the 
mesos-slave using zookeeper.  Lastly it sets the mesos-slave init config to
'start' so that mesos-slave is started on server restart.

### docker
The docker recipe installs docker via [Brian Flad's docker cookbook][] as well
as [Jason Dusek's mesos-docker script][] as a mesos executor.  After running 
this recipe on a mesos slave you should be able to run the mesos-docker
examples listed in [Jason Dusek's docker on mesos blog post][].

## Usage

Here is a sample role for configuring a Mesos master in a ZooKeeper backed 
production mode.

```YAML
chef_type:           role
default_attributes:
description:
env_run_lists:
json_class:          Chef::Role
name:                mesosphere_mesos
override_attributes:
  mesos:
    version: 0.14.0
    cluster_name: mesos-sandbox
    zookeeper_server_list: [ '203.0.113.2', '203.0.113.3', '203.0.113.4' ]
    zookeeper_port: 2181
    zookeeper_path: 'mesos-sandbox'
run_list:
  recipe[mesosphere_mesos::master]
```

Here is a sample role for creating a Mesos slave node with a seperate ZooKeeper 
ensemble dynamically discovered via Netflix Exhibitor:
```YAML
chef_type:           role
default_attributes:
description:
env_run_lists:
json_class:          Chef::Role
name:                mesosphere_mesos
override_attributes:
  mesos:
    version: 0.14.0
    cluster_name: mesos-sandbox
    zookeeper_path: 'mesos'
    zookeeper_exhibitor_discovery: true
    zookeeper_exhibitor_url: 'http://zk-exhibitor-endpoint.example.com:8080'
run_list:
  recipe[mesosphere_mesos::slave]
```

Here is a sample role for creating a Mesos slave node running the experimental 
docker executor.  This node is also dynamically configured via zookeeper and
exhibitor.  (Note: this recipe only works with Ubuntu 13.04 as of now.)
```YAML
chef_type:           role
default_attributes:
description:
env_run_lists:
json_class:          Chef::Role
name:                mesosphere_mesos_docker
override_attributes:
  mesos:
    version: 0.14.0
    cluster_name: mesos-sandbox
    zookeeper_path: 'mesos'
    zookeeper_exhibitor_discovery: true
    zookeeper_exhibitor_url: 'http://zk-exhibitor-endpoint.example.com:8080'
run_list:
  recipe[mesosphere_mesos::docker]
```

[Apache Mesos]: http://http://mesos.apache.org
[Netflix Exhibitor]: https://github.com/Netflix/exhibitor
[Mesosphere]: http://mesosphere.io
[Brian Flad's docker cookbook]: https://github.com/bflad/chef-docker
[Jason Dusek's mesos-docker script]: https://github.com/mesosphere/mesos-docker
[Jason Dusek's docker on mesos blog post]: http://mesosphere.io/2013/09/26/docker-on-mesos/

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Author

* Author: [Ray Rodriguez](https://github.com/rayrod2030)

Copyright 2013 Medidata Solutions Worldwide

Licensed under the Apache License, Version 2.0 (the "License"); you may not use 
this file except in compliance with the License. You may obtain a copy of the 
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed 
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
CONDITIONS OF ANY KIND, either express or implied. See the License for the 
specific language governing permissions and limitations under the License.
