Mesos Cookbook
==============
[![Cookbook](http://img.shields.io/cookbook/v/mesos.svg)](https://supermarket.chef.io/cookbooks/mesos)
[![Build Status](https://secure.travis-ci.org/mdsol/mesos_cookbook.png?branch=master)](http://travis-ci.org/mdsol/mesos_cookbook)
[![Gitter chat](https://img.shields.io/badge/Gitter-mdsol%2Fmesos_cookbook-brightgreen.svg)](https://gitter.im/mdsol/mesos_cookbook)

Application cookbook for installing the [Apache Mesos][] cluster manager.
Mesos provides efficient resource isolation and sharing across distributed
applications, or frameworks.  This cookbook installs Mesos via packages
provided by [Mesosphere][].

Requirements
------------

- Chef >= 12.5.1

Platform
--------
Tested on

* Ubuntu 15.04
* Ubuntu 14.04
* Ubuntu 12.04
* Debian 8.2
* CentOS 7.1
* CentOS 6.7

Supported Mesos versions
------------------------

This cookbook is tested against the following Apache Mesos versions:

* 0.25.0
* 0.24.1
* 0.24.0
* 0.23.0

We intend to support at most the three latest versions of Apache Mesos including
all patch releases for supported major versions. Ex. 0.21.0 + 0.21.1 etc..

Attributes
----------
In order to keep the README managable and in sync with the attributes, this
cookbook documents attributes inline. The usage instructions and default
values for attributes can be found in the individual attribute files.

Configuring Mesos via attributes
-----------------------------------------
This cookbook introduces a few points of validation to prevent passing Mesos
invalid configuration options. The ruby block
`mesos-slave-configuration-validation` and
`mesos-master-configuration-validation` extract a hash of all valid Mesos
configuration options from the `--help` output of the master and slave binary
and check it against the provided attributes. This cookbook will fail to
converge if you try to use an invalid configuration option as a command line
flag attribute under `['mesos']['master']['flags']`
or `['mesos']['slave']['flags']` hashes.

The valid list of Mesos options may be found at:
https://github.com/apache/mesos/blob/master/docs/configuration.md

## Recipes

### default
The default mesos recipe will run mesos::install.

### install
The install recipe installs the specified version of the mesosphere mesos
RPM or Debian package and installs it.  It’s also configured to stop both
mesos-master and mesos-slave init files so that they don't automatically
start on server restart.

### master
The master recipe runs mesos::install as well as creating several
mesos-master configuration files that are used at startup.  This recipe also
uses the zookeeper attributes and/or exhibitor attributes to configure the
mesos-master using zookeeper.  Lastly it sets the mesos-master init config to
'start' so that mesos-master is started on server restart.

### slave
The slave recipe runs mesos::install as well as creating several
mesos-slave configuration files that are used at startup.  This recipe also
uses the zookeeper attributes and/or exhibitor attributes to configure the
mesos-slave using zookeeper.  Lastly it sets the mesos-slave init config to
'start' so that mesos-slave is started on server restart.

### repo
The repo recipe contains logic for setting up Mesosphere debian and RPM
repositories.

Dependencies
------------

The following cookbooks are dependencies:

* [apt][]
* [yum][]
* [java][]
* [chef-sugar][]

The following cookbooks are suggested:

* [exhibitor][] (used for discovering ZooKeeper ensembles via [Netflix Exhibitor][])

Usage
-----

Here is a sample role for configuring a Mesos master in a ZooKeeper backed
production mode.

```YAML
chef_type:           role
default_attributes:
description:
env_run_lists:
json_class:          Chef::Role
name:                mesos_master
override_attributes:
  mesos:
    version: 0.25.0
    master:
      flags:
        cluster: 'mesos-sandbox'
        zk: 'zk://127.0.0.1:2181/mesos'
run_list:
  recipe[mesos::master]
```

Here is a sample role for creating a Mesos slave node with a seperate ZooKeeper
ensemble dynamically discovered via Netflix Exhibitor:
```YAML
chef_type:           role
default_attributes:
description:
env_run_lists:
json_class:          Chef::Role
name:                mesos_slave
override_attributes:
  mesos:
    version: 0.25.0
    slave:
      flags:
        master: 'zk://127.0.0.1:2181/mesos'
run_list:
  recipe[mesos::slave]
```

Development
-----------
Please see the [Contributing](CONTRIBUTING.md) and [Issue Reporting](ISSUES.md) Guidelines.

License and Author
------------------
* Author: [Ray Rodriguez](https://github.com/rayrod2030)(rayrod2030@gmail.com)
* Author: [Robert Veznaver](https://github.com/rveznaver)(robert.veznaver@gmail.com)

Copyright 2015 Medidata Solutions Worldwide

Licensed under the Apache License, Version 2.0 (the "License"); you may not use 
this file except in compliance with the License. You may obtain a copy of the 
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed 
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
CONDITIONS OF ANY KIND, either express or implied. See the License for the 
specific language governing permissions and limitations under the License.

[Apache Mesos]: http://mesos.apache.org
[Netflix Exhibitor]: https://github.com/Netflix/exhibitor
[Mesosphere]: http://mesosphere.io
[Medidata Solutions]: http://www.mdsol.com
[exhibitor]: https://github.com/SimpleFinance/chef-exhibitor
[apt]: https://github.com/opscode-cookbooks/apt
[yum]: https://github.com/chef-cookbooks/yum
[java]: https://github.com/agileorbit-cookbooks/java
[chef-sugar]: https://github.com/sethvargo/chef-sugar
