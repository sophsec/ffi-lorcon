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

require 'ffi/lorcon/driver'

module FFI
  module Lorcon
    class DriverList

      include Enumerable

      def initialize(first_driver)
        @driver = first_driver
      end

      def first
        @driver
      end

      def empty?
        @driver.nil?
      end

      def each(&block)
        current_driver = @driver

        while current_driver
          block.call(current_driver)
          current_driver = current_driver.next
        end

        return self
      end

    end
  end
end
