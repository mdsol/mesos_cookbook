# This simple test recipe should be discovered my minitest-handler
require 'minitest/spec'
require 'socket'

describe_recipe 'mesos::test' do

  it 'exposes the Mesos service on the configured port' do
    port = node['mesos']['port']
    begin
      socket = TCPSocket.new 'localhost', port
    rescue
      Chef::Log.error "could not connect to localhost:#{port}"
    end
    assert((socket.nil?), "Expected mesos to be running on port #{port}")
    socket && socket.close
  end

end
