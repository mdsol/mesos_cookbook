#
# Cookbook Name:: mesos
# Library:: helpers
#
# Copyright (C) 2013 Medidata Solutions, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module ::Mesos
  # Adds retry logic to exhibitor discovery
  #
  # @return [Hash]
  def discover_zookeepers_with_retry(url)
    tries ||= 5
    discover_zookeepers(url)
  rescue ExhibitorError
    Chef::Log.warn("Error while attempting to discover exhibitor zookeepers: Retry #{6 - tries} of 5")
    retry unless (tries -= 1).zero?
  end
end
