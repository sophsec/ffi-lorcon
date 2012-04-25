require 'rubygems'

gem 'rspec', '~> 2.4'
require 'spec'

require 'ffi/lorcon/version'

include FFI
include FFI::Lorcon

unless (IFACE = ENV['IFACE'])
  warn "Warning: you must specify the IFACE environment variable"
end
