#
#--
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
#++
#

require 'ffi/lorcon/driver'
require 'ffi/lorcon/driver_list'

module FFI
  module Lorcon
    extend FFI::Library

    ffi_lib 'orcon'

    attach_function :lorcon_get_version, [], :uint

    attach_function :lorcon_list_drivers, [], :pointer
    attach_function :lorcon_find_driver, [:string], :pointer
    attach_function :lorcon_auto_driver, [:string], :pointer
    attach_function :lorcon_free_driver_list, [:pointer], :void

    attach_function :lorcon_create, [:string, :pointer], :pointer
    attach_function :lorcon_free, [:pointer], :void

    attach_function :lorcon_open_inject, [:pointer], :int
    attach_function :lorcon_open_monitor, [:pointer], :int
    attach_function :lorcon_open_injmon, [:pointer], :int

    attach_function :lorcon_set_vap, [:pointer, :string], :void
    attach_function :lorcon_get_vap, [:pointer], :string
    attach_function :lorcon_get_capiface, [:pointer], :string
    attach_function :lorcon_get_driver_name, [:pointer], :string

    attach_function :lorcon_close, [:pointer], :void

    # TODO: Missing functions
    #attach_function :lorcon_get_datalink, [:pointer], :int
    #attach_function :lorcon_set_datalink, [:pointer, :int], :int
    #
    #attach_function :lorcon_set_channel, [:pointer, :int], :int
    #attach_function :lorcon_get_channel, [:pointer], :int
    #
    #attach_function :lorcon_get_pcap, [:pointer], :pointer

    attach_function :lorcon_get_selectable_fd, [:pointer], :int
    attach_function :lorcon_next_ex, [:pointer, :pointer], :int
    attach_function :lorcon_set_filter, [:pointer, :string], :int
    attach_function :lorcon_loop, [:pointer, :int, :lorcon_handler, :pointer], :int
    attach_function :lorcon_dispatch, [:pointer, :int, :lorcon_handler, :pointer], :int
    attach_function :lorcon_breakloop, [:pointer], :void
    attach_function :lorcon_inject, [:pointer, :pointer], :int
    attach_function :lorcon_send_bytes, [:pointer, :int, :pointer], :int

    attach_function :lorcon_add_wepkey, [:pointer, :pointer, :pointer, :int], :int
    def Lorcon.list_drivers
      DriverList.new(Driver.new(Lorcon.lorcon_list_drivers))
    end

    def Lorcon.find_driver(name)
      Driver.new(Lorcon.lorcon_find_driver(name))
    end

    def Lorcon.default_driver(name)
      Driver.new(Lorcon.lorcon_auto_driver(name))
    end
  end
end
