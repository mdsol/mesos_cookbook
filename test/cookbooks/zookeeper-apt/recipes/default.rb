#
# This recipe installs a local zookeeper server using the zookeeper and
# zookeeperd apt packages.
#

%w(zookeeper zookeeperd).each do |pkg|
  package pkg do
    action :install
  end
end
