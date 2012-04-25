#
# lorcon-ffi - Ruby FFI bindings for liborcon.
#
# Copyright (c) 2009 Postmodern (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'ffi'

module FFI
  module Lorcon
    extend FFI::Library

    callback :lorcon_handler, [:pointer, :pointer, :pointer], :void

    callback :lorcon_close, [:pointer], :int

    callback :lorcon_open_inject, [:pointer], :int
    callback :lorcon_open_monitor, [:pointer], :int
    callback :lorcon_open_inject_monitor, [:pointer], :int

    callback :lorcon_set_channel, [:pointer, :int], :int
    callback :lorcon_get_channel, [:pointer], :int

    callback :lorcon_send_packet, [:pointer, :pointer], :int
    callback :lorcon_get_packet, [:pointer, :pointer], :int

    callback :lorcon_set_dlt, [:pointer, :int], :int
    callback :lorcon_get_dlt, [:pointer], :int

    callback :lorcon_driver_init, [:pointer], :int
    callback :lorcon_driver_probe, [:string], :int
  end
end
