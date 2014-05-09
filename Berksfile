source 'https://api.berkshelf.com'

metadata

cookbook 'yum', '~> 3.0'

group :integration do
  cookbook 'zookeeper-apt',  path: 'test/cookbooks/zookeeper-apt'
  cookbook 'zookeeper-yum',  path: 'test/cookbooks/zookeeper-yum'
end
