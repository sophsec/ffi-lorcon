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

require 'ffi/lorcon/types'

require 'ffi'

module FFI
  module Lorcon
    class Driver < FFI::Struct

      layout :name, :string,
             :details, :string,
             :init_func, :lorcon_driver_init,
             :probe_func, :lorcon_driver_probe,
             :next, :pointer

      def name
        self[:name]
      end

      def details
        self[:details]
      end

      def next
        unless self[:next].null?
          Driver.new(self[:next])
        end
      end

      alias to_s name

    end
  end
end
