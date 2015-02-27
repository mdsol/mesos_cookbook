Mesos Cookbook
==============
[![Build Status](https://secure.travis-ci.org/mdsol/mesos_cookbook.png?branch=master)](http://travis-ci.org/mdsol/mesos_cookbook)

Application cookbook for installing the [Apache Mesos][] cluster manager.
Mesos provides efficient resource isolation and sharing across distributed
applications, or frameworks.  This cookbook installs Mesos via packages
provided by [Mesosphere][].

This cookbook serves as the base for the following additional Mesos framework
cookbooks maintained by [Medidata Solutions][]:

* [marathon][] - This cookbook installs the Apache Mesos Marathon framework.
* [chronos][] - This cookbook installs the Apache Mesos Chronos framework.


Requirements
------------

- Chef >= 11
- Ruby 1.9.3 or higher

Platform
--------
Tested on

* Ubuntu 14.04
* Ubuntu 13.10
* Ubuntu 12.04
* Debian Wheezy
* CentOS 6

Note: Mesosphere RPM’s are provided for Redhat Enterprise Linux 6 and 7 but
due to licensing issues those distributions are not officially tested for this
cookbook however we may test on Fedora in the future.

Supported Mesos Versions
------------------------

This cookbook supports the following Apache Mesos versions:

* 0.21.1
* 0.21.0
* 0.20.1
* 0.20.0
* 0.19.1
* 0.19.0

We intend to support at most the three latest versions of Apache Mesos including
all patch releases for supported major versions. Ex. 0.20.0 + 0.20.1 etc..

Attributes
----------
In order to keep the README managable and in sync with the attributes, this
cookbook documents attributes inline. The usage instructions and default
values for attributes can be found in the individual attribute files.

Configuring Mesos via attributes
-----------------------------------------
This cookbook introduces a few points of validation to prevent passing Mesos
invalid configuration options.  The file [attributes/mesos_options.rb](attributes/mesos_options.rb)
contains a hash of all valid Mesos configuration options for all Mesos versions
supported by this cookbook.  This cookbook will fail to converge if you try to
use an invalid configuration option as a command line flag attribute under
`[‘mesos’][‘master’][‘flags]` or `[‘mesos’][‘slave’][‘flags]` hashes.

The valid list of Mesos options are available in the Mesos documentation for the
latest options here: http://mesos.apache.org/documentation/latest/configuration/
as well as in this Google Sheets document which keeps track of what configuration
options are available per Mesos version here:
https://docs.google.com/spreadsheets/d/1IER03xhtOSj9unW5AYIqn-tu-laAHlPSOYhM6xw4QHg/edit#gid=0

This cookbook also ensures that only Mesos versions that are defined in
[attributes/mesosphere_packages.rb](attributes/mesosphere_packages.rb) hash can be
installed.  If you wish to install a custom mesos package or version simply override
the hash `[‘mesos’][‘mesosphere_packages’]` with the location of your mesos package
along with a valid SHA256 checksum.

## Recipes

### default
The default mesos recipe will run mesos::install.

### install
The install recipe pulls down the specified version of the mesosphere mesos
package and installs it.  It also configures to stop both mesos-master and
mesos-slave init files so that they don't automatically start on server
restart.

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

### docker
This recipe is no longer needed for Mesos versions 0.20.0 and higher since those
versions introduced native docker support.  Once this cookbook drops support for
Mesos 0.19.x this recipe will be removed.

The docker recipe installs docker via [Brian Flad's docker cookbook][] as well
as [Jason Dusek's mesos-docker script][] as a mesos executor.  After running
this recipe on a mesos slave you should be able to run the mesos-docker
examples listed in [Jason Dusek's docker on mesos blog post][].

Dependencies
------------

The following cookbooks are dependencies:

* [apt][]
* [yum][]
* [java][]
* [docker][]
* [chef-sugar][]

The following cookbooks are suggested:

* [zookeeper][] (used for discovering ZooKeeper ensembles via [Netflix Exhibitor][])

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
    version: 0.21.0
    cluster_name: mesos-sandbox
    zookeeper_server_list: [ '203.0.113.2', '203.0.113.3', '203.0.113.4' ]
    zookeeper_port: 2181
    zookeeper_path: 'mesos-sandbox'
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
    version: 0.21.0
    cluster_name: mesos-sandbox
    zookeeper_path: 'mesos'
    zookeeper_exhibitor_discovery: true
    zookeeper_exhibitor_url: 'http://zk-exhibitor-endpoint.example.com:8080'
run_list:
  recipe[mesos::slave]
```

Development
-----------
Please see the [Contributing](CONTRIBUTING.md) and [Issue Reporting](ISSUES.md) Guidelines.

License and Author
------------------
* Author: [Ray Rodriguez](https://github.com/rayrod2030)(rayrod2030@gmail.com)
* Author: [Mark Corwin](https://github.com/mjcdiggity)
* Contributor: [Asher Feldman](https://github.com/asher)
* Contributor: [Steven Borrelli](https://github.com/stevendborrelli)

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
[Brian Flad's docker cookbook]: https://github.com/bflad/chef-docker
[Jason Dusek's mesos-docker script]: https://github.com/mesosphere/mesos-docker
[Jason Dusek's docker on mesos blog post]: http://mesosphere.io/2013/09/26/docker-on-mesos/
[Medidata Solutions]: http://www.mdsol.com
[marathon]: https://github.com/mdsol/marathon_cookbook
[chronos]: https://github.com/mdsol/chronos_cookbook
[zookeeper]: https://github.com/SimpleFinance/chef-zookeeper
[apt]: https://github.com/opscode-cookbooks/apt
[yum]: https://github.com/chef-cookbooks/yum
[java]: https://github.com/agileorbit-cookbooks/java
[docker]: https://github.com/bflad/chef-docker
[chef-sugar]: https://github.com/sethvargo/chef-sugar

