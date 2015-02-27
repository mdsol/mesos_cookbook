#
# Cookbook Name:: mesos
# Library:: helpers
#
# Copyright (C) 2015 Medidata Solutions, Inc.
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

# rubocop:disable Style/ClassAndModuleChildren
module MesosHelper
  module MesosServerType
    MASTER = 'master'
    SLAVE = 'slave'
  end

  # Adds retry logic to exhibitor discovery
  #
  # @return [Hash]
  def self.discover_zookeepers_with_retry(url)
    tries ||= 5
    discover_zookeepers(url)
  rescue ExhibitorError
    Chef::Log.warn("Error while attempting to discover exhibitor zookeepers: Retry #{6 - tries} of 5")
    retry unless (tries -= 1).zero?
  end

  def self.update_mesos_options(options, server_type, mesos_version)
    Chef::Log.info("Updating mesos-#{server_type} config!!!!")

    # Clear out all config
    MesosHelper.clear_config(server_type)

    # Generating mesos configuration
    options.keys.sort.each do |config_key|
      config_value = options[config_key]
      Chef::Log.info("mesos-#{server_type} config [#{config_key}]: #{config_value}")

      if MesosHelper.boolean?(config_value)
        # This is a flag so set it accordingly
        MesosHelper.set_flag(config_key, config_value, server_type, mesos_version)
      else
        # This is a normal flag
        MesosHelper.set_option(config_key, config_value, server_type, mesos_version)
      end
    end
  end

  def self.clear_config(server_type)
    if server_type == 'slave'
      cmd = Mixlib::ShellOut.new("find /etc/mesos-#{server_type} -mindepth 1 ! -name 'attributes' ! -name 'resources' -exec rm -rf {} +")
    else
      cmd = Mixlib::ShellOut.new("rm -rf /etc/mesos-#{server_type}/*")
    end
    cmd.run_command
    cmd.error!
  end

  def self.set_option(config_key, config_value, server_type, _mesos_version)
    case config_key
    when 'attributes', 'resources'
      Chef::Log.info("Found an attribute or resource #{config_key}:#{config_value}")
      config_value.each do |key, value|
        cmd = Mixlib::ShellOut.new("echo '#{value}' > /etc/mesos-#{server_type}/#{config_key}/#{key}")
        cmd.run_command
        cmd.error!
      end
    else
      Chef::Log.info("Found a normal option #{config_key}:#{config_value}")
      cmd = Mixlib::ShellOut.new("echo #{config_value} > /etc/mesos-#{server_type}/#{config_key}")
      cmd.run_command
      cmd.error!
    end
  end

  def self.set_flag(config_key, config_value, server_type, mesos_version)
    Chef::Log.info("Found a flag! #{config_key}:#{config_value}")
    cmd = Mixlib::ShellOut.new('')

    if config_value == true || config_value.to_s.downcase.strip =~ /^(true|yes)$/
      cmd = Mixlib::ShellOut.new("touch /etc/mesos-#{server_type}/#{MesosHelper.flag_identifier(mesos_version)}#{config_key}")
    else
      cmd = Mixlib::ShellOut.new("touch /etc/mesos-#{server_type}/#{MesosHelper.flag_identifier(mesos_version)}no-#{config_key}")
    end

    cmd.run_command
    cmd.error!
  end

  def self.flag_identifier(mesos_version)
    if mesos_version =~ /0\.19\.\d/
      return ''
    else
      return '?'
    end
  end

  def self.boolean?(config_value)
    # rubocop:disable Style/DoubleNegation
    !!config_value == config_value || config_value.to_s.downcase.strip =~ /^(true|yes|false|no)$/
    # rubocop:enableStyle/DoubleNegation
  end
end
# rubocop:eable Style/ClassAndModuleChildren
