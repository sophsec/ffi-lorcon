#
#--
# lorcon-ffi - Ruby FFI bindings for liborcon.
#
# Copyright (c) 2009 Postmodern (postmodern at sophsec.com)
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

require 'lorcon-ffi/typedefs'
require 'lorcon-ffi/driver'

require 'ffi'

module FFI
  module Lorcon
    extend FFI::Library

    ffi_lib 'liborcon'

    attach_function :lorcon_get_version, [], :uint
    attach_function :lorcon_list_drivers, [], :pointer
    attach_function :lorcon_find_driver, [:string], :pointer
    attach_function :lorcon_auto_driver, [:string], :pointer
    attach_function :lorcon_free_driver_list, [:pointer], :void

    def Lorcon.list_drivers
      Driver.new(Lorcon.lorcon_list_drivers)
    end

    def Lorcon.find_driver(name)
      Driver.new(Lorcon.lorcon_find_driver(name))
    end

    def Lorcon.default_driver(name)
      Driver.new(Lorcon.lorcon_auto_driver(name))
    end
  end
end
