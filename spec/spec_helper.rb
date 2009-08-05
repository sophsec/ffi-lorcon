require 'rubygems'
gem 'rspec', '>=1.1.12'
require 'spec'

require 'lorcon-ffi/version'

include FFI
include FFI::Lorcon

unless (IFACE = ENV['IFACE'])
  STDERR.puts "Warning: you must specify the IFACE environment variable"
end
