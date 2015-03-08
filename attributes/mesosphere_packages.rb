default['mesos']['mesosphere_packages'] = {
  '0.21.1' => {
    'ubuntu' => {
      '14.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.21.1-1.1.ubuntu1404_amd64.deb',
        'checksum' => 'beda46628cacb97e730ed8f4b5659c24d71aca0e9624602f6c9b1208f405c12e',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/14.04/mesos-0.21.1-py2.7-linux-x86_64.egg'
      },
      '13.10' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/13.10/mesos_0.21.1-1.1.ubuntu1310_amd64.deb',
        'checksum' => '5aa4117ba86e75a32a1f42f3f53d98107b7f1e2cb65bd0b677e3b07d9e471842',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/13.10/mesos-0.21.1-py2.7-linux-x86_64.egg'
      },
      '13.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos_0.21.1-1.1.ubuntu1304_amd64.deb',
        'checksum' => '90c31d24699e3bb7b372b3fca26febe2b2bdb313d99905999cc4f281dc07ecb0',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos-0.21.1-py2.7-linux-x86_64.egg'
      },
      '12.10' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/12.10/mesos_0.21.1-1.1.ubuntu1210_amd64.deb',
        'checksum' => 'cfa39f6fbf6d5d385b9bc8f5932bc5d4218cf927b6aa861d32b37449787a48e5',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/12.10/mesos-0.21.1-py2.7-linux-x86_64.egg'
      },
      '12.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/12.04/mesos_0.21.1-1.1.ubuntu1204_amd64.deb',
        'checksum' => 'c277b9e0c05cdb98bff738b34c8b4a460e10476779a109fde8caf337d5b47f1a',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/12.04/mesos-0.21.1-py2.7-linux-x86_64.egg'
      }
    },
    'debian' => {
      '7.8' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.21.1-1.2.debian77_amd64.deb',
        'checksum' => '888643e0160b5bf9b30cc62d5e7ddb87f12fe4460e57e9bba7669e1b42b521fa',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.21.1-py2.7-linux-x86_64.egg'
      },
      '7.7' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.21.1-1.2.debian77_amd64.deb',
        'checksum' => '888643e0160b5bf9b30cc62d5e7ddb87f12fe4460e57e9bba7669e1b42b521fa',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.21.1-py2.7-linux-x86_64.egg'
      },
      '7.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.21.1-1.2.debian77_amd64.deb',
        'checksum' => '888643e0160b5bf9b30cc62d5e7ddb87f12fe4460e57e9bba7669e1b42b521fa',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.21.1-py2.7-linux-x86_64.egg'
      },
      '7.1' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.21.1-1.2.debian77_amd64.deb',
        'checksum' => '888643e0160b5bf9b30cc62d5e7ddb87f12fe4460e57e9bba7669e1b42b521fa',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.21.1-py2.7-linux-x86_64.egg'
      }
    },
    'centos' => {
      '6.6' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.1-1.1.centos65.x86_64.rpm',
        'checksum' => 'c7d152e20f7d543510e946860f3917c61d55314a6a2ff6d43d7efb55387ccca6',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.1-py2.6.egg'
      },
      '6.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.1-1.1.centos65.x86_64.rpm',
        'checksum' => 'c7d152e20f7d543510e946860f3917c61d55314a6a2ff6d43d7efb55387ccca6',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.1-py2.6.egg'
      },
      '6.4' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.1-1.1.centos65.x86_64.rpm',
        'checksum' => 'c7d152e20f7d543510e946860f3917c61d55314a6a2ff6d43d7efb55387ccca6',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.1-py2.6.egg'
      },
      '7' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/7/mesos-0.21.1-1.1.centos701406.x86_64.rpm',
        'checksum' => 'ee54fe6e54c71d376230a18b3abb252c7dd04a5fe8613f1fcd637ab3b6a1d370',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/7/mesos-0.21.1-py2.7-linux-x86_64.egg'
      }
    },
    'redhat' => {
      '6.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.21.1-1.1.redhat65.x86_64.rpm',
        'checksum' => 'e7df8c3a8022277b08c080722a916edefae87fd9c8835b5eced723e21d3e0ba9',
        'python_egg' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.21.1-py2.6-linux-x86_64.egg'
      },
      '6.4' => {
        'package_url' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.21.1-1.1.redhat65.x86_64.rpm',
        'checksum' => 'e7df8c3a8022277b08c080722a916edefae87fd9c8835b5eced723e21d3e0ba9',
        'python_egg' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.21.1-py2.6-linux-x86_64.egg'
      }
    }
  },
  '0.21.0' => {
    'ubuntu' => {
      '14.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.21.0-1.0.ubuntu1404_amd64.deb',
        'checksum' => 'd97666c732137700c6fc564e7195bbc6346a42c8164136e6a434fb81f4054858',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/14.04/mesos-0.21.0-py2.7-linux-x86_64.egg'
      },
      '13.10' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/13.10/mesos_0.21.0-1.0.ubuntu1310_amd64.deb',
        'checksum' => 'fb0556227b5c26f25a7b2a2a36874a537d37ba14a350a073d2202a9aabe5268d',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/13.10/mesos-0.21.0-py2.7-linux-x86_64.egg'
      },
      '13.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos_0.21.0-1.0.ubuntu1304_amd64.deb',
        'checksum' => 'beade87e871adc0675e9c16aa8dfa1e640b67b3c7804334450748bda53d77cfb',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos-0.21.0-py2.7-linux-x86_64.egg'
      },
      '12.10' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/12.10/mesos_0.21.0-1.0.ubuntu1210_amd64.deb',
        'checksum' => 'f766cff65a53e936a366bd25ab4b1c0521b4a006493dc68f5bc2675fd71e893e',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/12.10/mesos-0.21.0-py2.7-linux-x86_64.egg'
      },
      '12.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/12.04/mesos_0.21.0-1.0.ubuntu1204_amd64.deb',
        'checksum' => '5c7279c1bee08a24e893cb5f1373f0855df23f921177759195c03bb86619c9bd',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/12.04/mesos-0.21.0-py2.7-linux-x86_64.egg'
      }
    },
    'debian' => {
      '7.8' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.21.0-1.0.debian77_amd64.deb',
        'checksum' => 'b6d40343cef4dee2df22719fea18984e5caa470158783ed8aaabd547dff490aa',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.21.0-py2.7-linux-x86_64.egg'
      },
      '7.7' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.21.0-1.0.debian77_amd64.deb',
        'checksum' => 'b6d40343cef4dee2df22719fea18984e5caa470158783ed8aaabd547dff490aa',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.21.0-py2.7-linux-x86_64.egg'
      },
      '7.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.21.0-1.0.debian77_amd64.deb',
        'checksum' => 'b6d40343cef4dee2df22719fea18984e5caa470158783ed8aaabd547dff490aa',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.21.0-py2.7-linux-x86_64.egg'
      },
      '7.1' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.21.0-1.0.debian77_amd64.deb',
        'checksum' => 'b6d40343cef4dee2df22719fea18984e5caa470158783ed8aaabd547dff490aa',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.21.0-py2.7-linux-x86_64.egg'
      }
    },
    'centos' => {
      '6.6' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.0-1.0.centos65.x86_64.rpm',
        'checksum' => '849b4dd2f035fca0eef29d8a07a0529f70b2a74826d7d43052eb9cf8a4a38e9c',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.0-py2.6.egg'
      },
      '6.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.0-1.0.centos65.x86_64.rpm',
        'checksum' => '849b4dd2f035fca0eef29d8a07a0529f70b2a74826d7d43052eb9cf8a4a38e9c',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.0-py2.6.egg'
      },
      '6.4' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.0-1.0.centos65.x86_64.rpm',
        'checksum' => '849b4dd2f035fca0eef29d8a07a0529f70b2a74826d7d43052eb9cf8a4a38e9c',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.0-py2.6.egg'
      },
      '7' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.21.0-1.0.centos65.x86_64.rpm',
        'checksum' => '1a7f0211b098fe80043904488d3b1e2b3f81d642b52afb9da1a008e93f33b2dd',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/7/mesos-0.21.0-py2.7-linux-x86_64.egg'
      }
    },
    'redhat' => {
      '6.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.21.0-1.0.redhat65.x86_64.rpm',
        'checksum' => 'ddb2f004b280ba1920e9a10c845aea8bc308029f06d92058ba129dd82a3401df',
        'python_egg' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.21.0-py2.6-linux-x86_64.egg'
      },
      '6.4' => {
        'package_url' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.21.0-1.0.redhat65.x86_64.rpm',
        'checksum' => 'ddb2f004b280ba1920e9a10c845aea8bc308029f06d92058ba129dd82a3401df',
        'python_egg' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.21.0-py2.6-linux-x86_64.egg'
      }
    }
  },
  '0.20.1' => {
    'ubuntu' => {
      '14.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.20.1-1.0.ubuntu1404_amd64.deb',
        'checksum' => '83f642cf03b0372ef71b0d45321a043a5afec1482cca00540c73b164d4a2bd54',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/14.04/mesos-0.20.1-py2.7-linux-x86_64.egg'
      },
      '13.10' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/13.10/mesos_0.20.1-1.0.ubuntu1310_amd64.deb',
        'checksum' => 'faf6350a9cd19eb5b67dcfa967067b275fba67b5b743495e7ebdca47b01efc3e',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/13.10/mesos-0.20.1-py2.7-linux-x86_64.egg'
      },
      '13.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos_0.20.1-1.0.ubuntu1304_amd64.deb',
        'checksum' => '9cf551671082fa3b75a812ef826b18582b1f9b0d1b650b79f5c2da0cf97573d2',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos-0.20.1-py2.7-linux-x86_64.egg'
      },
      '12.10' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/12.10/mesos_0.20.1-1.0.ubuntu1210_amd64.deb',
        'checksum' => '00b6561b1ec22a0815a8308c64bf73dec6bbe326b6cd8cc362f5d39b76260de2',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/12.10/mesos-0.20.1-py2.7-linux-x86_64.egg'
      },
      '12.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/12.04/mesos_0.20.1-1.0.ubuntu1204_amd64.deb',
        'checksum' => '4ae9959e91475df6a143f21fab689123b15384604e2e4ee2ea02b8714100fb40',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/12.04/mesos-0.20.1-py2.7-linux-x86_64.egg'
      }
    },
    'debian' => {
      '7.8' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.20.1-1.0.debian75_amd64.deb',
        'checksum' => 'da7e2e1d6c204c4628323465ccbdac2d28c98940fd1e32b013419dca4856a926',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.20.1-py2.7-linux-x86_64.egg'
      },
      '7.7' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.20.1-1.0.debian75_amd64.deb',
        'checksum' => 'da7e2e1d6c204c4628323465ccbdac2d28c98940fd1e32b013419dca4856a926',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.20.1-py2.7-linux-x86_64.egg'
      },
      '7.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.20.1-1.0.debian75_amd64.deb',
        'checksum' => 'da7e2e1d6c204c4628323465ccbdac2d28c98940fd1e32b013419dca4856a926',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.20.1-py2.7-linux-x86_64.egg'
      },
      '7.1' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.20.1-1.0.debian75_amd64.deb',
        'checksum' => 'da7e2e1d6c204c4628323465ccbdac2d28c98940fd1e32b013419dca4856a926',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.20.1-py2.7-linux-x86_64.egg'
      }
    },
    'centos' => {
      '7' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/7/mesos-0.20.1-1.0.centos701406.x86_64.rpm',
        'checksum' => '5a21a7ddf36597ebddace420c5654bf0725fa1f2e91d4ccced3fa54f23c02a84',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/7/mesos-0.20.1-py2.7-linux-x86_64.egg'
      },
      '6.6' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.1-1.0.centos64.x86_64.rpm',
        'checksum' => '1ae248728f4cbce1ff670feb0a1e4a8e4a9f5ee293161088b6d5ea1805e8fa88',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.1-py2.6.egg'
      },
      '6.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.1-1.0.centos64.x86_64.rpm',
        'checksum' => '1ae248728f4cbce1ff670feb0a1e4a8e4a9f5ee293161088b6d5ea1805e8fa88',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.1-py2.6.egg'
      },
      '6.4' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.1-1.0.centos64.x86_64.rpm',
        'checksum' => '1ae248728f4cbce1ff670feb0a1e4a8e4a9f5ee293161088b6d5ea1805e8fa88',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.1-py2.6.egg'
      }
    },
    'redhat' => {
      '7' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/7/mesos-0.20.1-1.0.centos701406.x86_64.rpm',
        'checksum' => '5a21a7ddf36597ebddace420c5654bf0725fa1f2e91d4ccced3fa54f23c02a84',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/7/mesos-0.20.1-py2.7-linux-x86_64.egg'
      },
      '6.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.20.1-1.0.redhat65.x86_64.rpm',
        'checksum' => '68b5759ff211e236c23af06cfddef034130d2a24b4b859123c9bbbc6e76db2e3',
        'python_egg' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.20.1-py2.6-linux-x86_64.egg'
      },
      '6.4' => {
        'package_url' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.20.1-1.0.redhat65.x86_64.rpm',
        'checksum' => '68b5759ff211e236c23af06cfddef034130d2a24b4b859123c9bbbc6e76db2e3',
        'python_egg' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.20.1-py2.6-linux-x86_64.egg'
      }
    }
  },
  '0.20.0' => {
    'ubuntu' => {
      '14.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.20.0-1.0.ubuntu1404_amd64.deb',
        'checksum' => '3abb31197fb63403c811b428df7bc780641d9ab7fd1adc488d86facda4d2db37',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/14.04/mesos-0.20.0-py2.7-linux-x86_64.egg'
      },
      '13.10' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/13.10/mesos_0.20.0-1.0.ubuntu1310_amd64.deb',
        'checksum' => '57976560d105b653b9b4c9390fd7ad3a531f5ff051f62e951a895ee1240ba5a5',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/13.10/mesos-0.20.0-py2.7-linux-x86_64.egg'
      },
      '13.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos_0.20.0-1.0.ubuntu1304_amd64.deb',
        'checksum' => '0430feadb39888971b76cb6d4779c0dba503fff8bc9856440726f1b52fddcc3b',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos-0.20.0-py2.7-linux-x86_64.egg'
      },
      '12.10' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/12.10/mesos_0.20.0-1.0.ubuntu1210_amd64.deb',
        'checksum' => 'b2ece55ef797907ead1e9015fdf19f2fd690252a96bcca3ec1ca22219c134961',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/12.10/mesos-0.20.0-py2.7-linux-x86_64.egg'
      },
      '12.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/12.04/mesos_0.20.0-1.0.ubuntu1204_amd64.deb',
        'checksum' => 'c43ed926567c44f5c730bda3e4c75320dc9990ad6fc7b4ec280f47d97a56cd20',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/12.04/mesos-0.20.0-py2.7-linux-x86_64.egg'
      }
    },
    'debian' => {
      '7.8' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.20.0-1.0.debian75_amd64.deb',
        'checksum' => '91fcdeaaf0c6e32558f8fbdbeb51646776e1a06ce34935ebdeabb83739783d45',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.20.0-py2.7-linux-x86_64.egg'
      },
      '7.7' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.20.0-1.0.debian75_amd64.deb',
        'checksum' => '91fcdeaaf0c6e32558f8fbdbeb51646776e1a06ce34935ebdeabb83739783d45',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.20.0-py2.7-linux-x86_64.egg'
      },
      '7.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.20.0-1.0.debian75_amd64.deb',
        'checksum' => '91fcdeaaf0c6e32558f8fbdbeb51646776e1a06ce34935ebdeabb83739783d45',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.20.0-py2.7-linux-x86_64.egg'
      },
      '7.1' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.20.0-1.0.debian75_amd64.deb',
        'checksum' => '91fcdeaaf0c6e32558f8fbdbeb51646776e1a06ce34935ebdeabb83739783d45',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.20.0-py2.7-linux-x86_64.egg'
      }
    },
    'centos' => {
      '6.6' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.0-1.0.centos64.x86_64.rpm',
        'checksum' => 'f6902b245e1800b5789c2e66728b50e43a52a593832985fc7e7e0ef916106d7f',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.0-py2.6.egg'
      },
      '6.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.0-1.0.centos64.x86_64.rpm',
        'checksum' => 'f6902b245e1800b5789c2e66728b50e43a52a593832985fc7e7e0ef916106d7f',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.0-py2.6.egg'
      },
      '6.4' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.0-1.0.centos64.x86_64.rpm',
        'checksum' => 'f6902b245e1800b5789c2e66728b50e43a52a593832985fc7e7e0ef916106d7f',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.20.0-py2.6.egg'
      }
    },
    'redhat' => {
      '6.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.20.0-1.0.redhat65.x86_64.rpm',
        'checksum' => '1293fabc24d6b76e83efaf02007a16fafb42979d8ab652b66f010a3469101a9f',
        'python_egg' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.20.0-py2.6-linux-x86_64.egg'
      },
      '6.4' => {
        'package_url' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.20.0-1.0.redhat65.x86_64.rpm',
        'checksum' => '1293fabc24d6b76e83efaf02007a16fafb42979d8ab652b66f010a3469101a9f',
        'python_egg' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.20.0-py2.6-linux-x86_64.egg'
      }
    }
  },
  '0.19.1' => {
    'ubuntu' => {
      '14.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.19.1-1.0.ubuntu1404_amd64.deb',
        'checksum' => 'fed60e529b03d37703772b92de888ac72036e08dccd78dd3efc415dc32b033e5',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/14.04/mesos-0.19.1-py2.7-linux-x86_64.egg'
      },
      '13.10' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/13.10/mesos_0.19.1-1.0.ubuntu1310_amd64.deb',
        'checksum' => '25037f519aa35b8131009503d2de955bfa9975415a0dbf655320a632f2491090',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/13.10/mesos-0.19.1-py2.7-linux-x86_64.egg'
      },
      '13.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos_0.19.1-1.0.ubuntu1304_amd64.deb',
        'checksum' => 'd3a392cf19f55bf2e1b105000271397978fa122f2d3b27031887a952df39ae66',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/13.04/mesos-0.19.1-py2.7-linux-x86_64.egg'
      },
      '12.10' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/12.10/mesos_0.19.1-1.0.ubuntu1210_amd64.deb',
        'checksum' => 'f7ae256a55b235da4b9bb6a0f7db09ed884f5a255540acd3c4c51c4309f72e6d',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/12.10/mesos-0.19.1-py2.7-linux-x86_64.egg'
      },
      '12.04' => {
        'package_url' => 'http://downloads.mesosphere.io/master/ubuntu/12.04/mesos_0.19.1-1.0.ubuntu1204_amd64.deb',
        'checksum' => 'd139d9b7f1353e6a8ca400a19388f41a34553517c640483ea7893ad69346b2e2',
        'python_egg' => 'http://downloads.mesosphere.io/master/ubuntu/12.04/mesos-0.19.1-py2.7-linux-x86_64.egg'
      }
    },
    'debian' => {
      '7.8' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.19.1-1.0.debian75_amd64.deb',
        'checksum' => '3dc823e3682a617f86c83580df8c54a13bcda2967469df223be6105cb702274d',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.19.1-py2.7-linux-x86_64.egg'
      },
      '7.7' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.19.1-1.0.debian75_amd64.deb',
        'checksum' => '3dc823e3682a617f86c83580df8c54a13bcda2967469df223be6105cb702274d',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.19.1-py2.7-linux-x86_64.egg'
      },
      '7.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.19.1-1.0.debian75_amd64.deb',
        'checksum' => '3dc823e3682a617f86c83580df8c54a13bcda2967469df223be6105cb702274d',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.19.1-py2.7-linux-x86_64.egg'
      },
      '7.1' => {
        'package_url' => 'http://downloads.mesosphere.io/master/debian/7/mesos_0.19.1-1.0.debian75_amd64.deb',
        'checksum' => '3dc823e3682a617f86c83580df8c54a13bcda2967469df223be6105cb702274d',
        'python_egg' => 'http://downloads.mesosphere.io/master/debian/7/mesos-0.19.1-py2.7-linux-x86_64.egg'
      }
    },
    'centos' => {
      '6.6' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.19.1-1.0.centos64.x86_64.rpm',
        'checksum' => '3599ead1fdf5b75cf5d0e13b1a5a5b8df60bc9c6bc48391927ec60f3a058c3a1',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.19.1-py2.6.egg'
      },
      '6.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.19.1-1.0.centos64.x86_64.rpm',
        'checksum' => '3599ead1fdf5b75cf5d0e13b1a5a5b8df60bc9c6bc48391927ec60f3a058c3a1',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.19.1-py2.6.egg'
      },
      '6.4' => {
        'package_url' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.19.1-1.0.centos64.x86_64.rpm',
        'checksum' => '3599ead1fdf5b75cf5d0e13b1a5a5b8df60bc9c6bc48391927ec60f3a058c3a1',
        'python_egg' => 'http://downloads.mesosphere.io/master/centos/6/mesos-0.19.1-py2.6.egg'
      }
    },
    'redhat' => {
      '6.5' => {
        'package_url' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.19.1-1.0.redhat64.x86_64.rpm',
        'checksum' => '59196eb8b80ecb409ca9d4c70b00c7bcbdfda02ba00096de05c475a285a92413',
        'python_egg' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.19.1-py2.6-linux-x86_64.egg'
      },
      '6.4' => {
        'package_url' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.19.1-1.0.redhat64.x86_64.rpm',
        'checksum' => '59196eb8b80ecb409ca9d4c70b00c7bcbdfda02ba00096de05c475a285a92413',
        'python_egg' => 'http://downloads.mesosphere.io/master/redhat/6/mesos-0.19.1-py2.6-linux-x86_64.egg'
      }
    }
  }
}
