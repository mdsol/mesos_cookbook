#
# This recipe installs a local zookeeper server using the zookeeper and
# zookeeperd apt packages.
#

include_recipe 'apt::default'

%w( zookeeper zookeeperd curl ).each do |pkg|
  package pkg do
    action :install
  end
end
