# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased][unreleased]

## [3.5.1] - 2015-12-23
### Fixed
- Fix Amazon Linux support

### Changed
- Set up yum repo with `yum_repository` provider
- Remove dependency on chef-sugar

## [3.5.0] - 2015-12-21
### Added
- Systemd support
- Dynamic configuration guard
- Set default `cgroups_hierarchy` attribute

### Changed
- Improved upstart script to start after network (@kamaradclimber)
- Default to Mesos 0.25.0
- Removed support for Mesos < 0.23.0
- Refactored testing suite
- Platform list updated to match Mesosphere package
- Tested with Chef 12.5.1

## [3.4.0] - 2015-08-25
### Added
- Added support for Apache Mesos 0.23.0.

### Changed
- Removed support for Ubuntu 13.10.
- Removed support for Mesos 0.20.x.
- Changed all compile_time calls to at_compile_time for Chef 12.2.x compatibility with ChefSugar.

## [3.3.0] - 2015-07-05
### Added
- Added support for Apache Mesos 0.22.1.
- Added vagrant-wrapper in gemfile for testing.
- Set ulimit for init service if defined.
- Install mesosphere packages from a package mirror.

### Changed
- Switched to using port 80 for Ubuntu Keyservers to get through corporate firewalls.

## [3.2.3] - 2015-03-29
### Fixed
- Fixed master and slave recipes to use node override for zk endpoints.

## [3.2.2] - 2015-03-29
### Fixed
- Fixed master and slave recipes to use node instead of default to set zk endpoints.

## [3.2.1] - 2015-03-29
### Fixed
- Fixed zk exhibitor discovery logic to use new master and slave flags.

## [3.2.0] - 2015-03-29
### Changed
- Updated default Mesos version to 0.21.1.
- Added support for Mesos 0.22.0.
- Removed support for Mesos 0.19.x.

## [3.1.0] - 2015-03-27
### Changed
- Refactor greatly simplifies Mesos wrapper script.
- Configuration now passed primarily via command line flags.
- Switched to Upstart & Sysvinit for Mesos init.
- Metadata uses suggests instead of recommends for the exhibitor cookbook.

### Contributors for this release:

- [Robert Vežnaver](https://github.com/rveznaver) - Amazing Mesos wrapper refactor.

Thank You!

## [3.0.0] - 2015-03-11
### Changed
- Mesos is now installed via the Mesosphere RPM and deb package repositories.
- Added validation for Mesos flags to ensure that Mesos starts with configured
flags.
- Added support for Mesos 0.21.1.
- Added all Mesos attributes which can be configured.
- Added libsvn1 depedency for newer Mesos versions.
- Updated rubocop style file.

### Fixed
- Fixed a bug with the ZK exhibitor discovery mechanism.
- Fixed redhat family name in install recipe.

### Removed
- Removed experimental docker recipe.
- Removed EC2 hostname logic.
- Removed support for Mesos 0.19.0.

## [2.0.0] - 2014-11-14
### Changed
- Writes all attributes under `node['mesos']['common]`/`node['mesos']['master']` to respective config files
- Adds support for Ubuntu 14.04 (Trusty Tahr)
- Adds support for Debian 7 (Wheezy)

## [1.0.6] - 2014-02-19
### Changed
- Re-added default-jre-headless as required package due to breaking issues with
  mesos debian package when used with a non-openjdk java like Oracle.
- Added some serverspecs to verify working cookbook with oracle jdk 7.

## [1.0.5] - 2014-02-15
### Changed

- Removed default-jre-headless as required package
- Added slave checkpointing defaults
- Added kitchen-ec2 configuration for CI

## [1.0.4] - 2014-02-07
### Changed

- Add support for RHEL linux family
- Updated integration tests (serverspec)

## [1.0.3] - 2014-02-03
### Changed

- Fix zk_string generating logic to strip triailing comma
- Add exhibitor discover zookeepers retry logic

## [1.0.2] - 2014-01-31
### Changed

- Fix docker-mesos egg url

## [1.0.1] - 2014-01-13
### Changed

- Update default mesos version to 0.15.0
- Use attribute for mesos python bindings egg

## [1.0.0] - 2013-12-12
### Changed

- Public release of cookbook
- Added experimental docker-mesos recipe
- Updated mesos default version to 0.14.2

## [0.1.0] - 2013-10-08
### Changed

- Initial Cookbook release

[unreleased]: https://github.com/mdsol/mesos_cookbook/compare/3.1.0...HEAD
[3.5.1]: https://github.com/mdsol/mesos_cookbook/compare/3.5.0...3.5.1
[3.5.0]: https://github.com/mdsol/mesos_cookbook/compare/3.4.0...3.5.0
[3.4.0]: https://github.com/mdsol/mesos_cookbook/compare/3.3.0...3.4.0
[3.3.0]: https://github.com/mdsol/mesos_cookbook/compare/3.2.3...3.3.0
[3.2.3]: https://github.com/mdsol/mesos_cookbook/compare/3.2.2...3.2.3
[3.2.2]: https://github.com/mdsol/mesos_cookbook/compare/3.2.1...3.2.2
[3.2.1]: https://github.com/mdsol/mesos_cookbook/compare/3.2.0...3.2.1
[3.2.0]: https://github.com/mdsol/mesos_cookbook/compare/3.1.0...3.2.0
[3.1.0]: https://github.com/mdsol/mesos_cookbook/compare/3.0.0...3.1.0
[3.0.0]: https://github.com/mdsol/mesos_cookbook/compare/2.0.0...3.0.0
[2.0.0]: https://github.com/mdsol/mesos_cookbook/compare/1.0.6...2.0.0
[1.0.6]: https://github.com/mdsol/mesos_cookbook/compare/1.0.5...1.0.6
[1.0.5]: https://github.com/mdsol/mesos_cookbook/compare/1.0.4...1.0.5
[1.0.4]: https://github.com/mdsol/mesos_cookbook/compare/1.0.3...1.0.4
[1.0.3]: https://github.com/mdsol/mesos_cookbook/compare/1.0.2...1.0.3
[1.0.2]: https://github.com/mdsol/mesos_cookbook/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/mdsol/mesos_cookbook/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/mdsol/mesos_cookbook/compare/0.1.0...1.0.0
[0.1.0]: https://github.com/mdsol/mesos_cookbook/compare/0.1.0...0.1.0
