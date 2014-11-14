mesos Cookbook CHANGELOG
==========================
This file is used to list changes made in each version of the mesos cookbook.

2.0.0 (2014-11-14)
------------------
- Writes all attributes under `node['mesos']['common]`/`node['mesos']['master']` to respective config files
- Adds support for Ubuntu 14.04 (Trusty Tahr)
- Adds support for Debian 7 (Wheezy)


1.0.6 (2014-02-19)
------------------

- Re-added default-jre-headless as required package due to breaking issues with
  mesos debian package when used with a non-openjdk java like Oracle.
- Added some serverspecs to verify working cookbook with oracle jdk 7.

1.0.5 (2014-02-15)
------------------

- Removed default-jre-headless as required package
- Added slave checkpointing defaults
- Added kitchen-ec2 configuration for CI

1.0.4 (2014-02-07)
------------------

- Add support for RHEL linux family
- Updated integration tests (serverspec)

1.0.3 (2014-02-03)
------------------

- Fix zk_string generating logic to strip triailing comma
- Add exhibitor discover zookeepers retry logic

1.0.2 (2014-01-31)
------------------

- Fix docker-mesos egg url

1.0.1 (2014-01-13)
------------------

- Update default mesos version to 0.15.0
- Use attribute for mesos python bindings egg

1.0.0 (2013-12-12)
-------------------

- Public release of cookbook
- Added experimental docker-mesos recipe
- Updated mesos default version to 0.14.2

0.1.0 (2013-10-08)
-------------------

- Initial Cookbook release
