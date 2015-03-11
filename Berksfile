source 'https://supermarket.getchef.com'

metadata

cookbook 'yum', '~> 3.0'
cookbook 'exhibitor', git: 'git@github.com:SimpleFinance/chef-exhibitor.git', branch: 'master'

group :integration do
  cookbook 'zookeeper-apt',  path: 'test/cookbooks/zookeeper-apt'
  cookbook 'zookeeper-yum',  path: 'test/cookbooks/zookeeper-yum'
end
