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

require 'lorcon-ffi/wep'
require 'lorcon-ffi/types'

require 'ffi'

module FFI
  module Lorcon
    class Handler < FFI::Struct

      STATUS_MAX = 1024

      MAX_IFNAME_LEN = 32

      layout :driver_name, [:char, MAX_IFNAME_LEN],
             :vap_name, [:char, MAX_IFNAME_LEN],
             :pcap, :pointer,
             :inject_fd, :int,
             :ioctl_fd, :int,
             :capture_fd, :int,
             :packets_sent, :int,
             :packets_recv, :int,
             :dlt, :int,
             :channel, :int,
             :errstr, [:char, STATUS_MAX],
             :original_mac, [Types::UINT8, 6],
             :auxptr, :pointer,
             :handler_callback, :lorcon_handler,
             :handler_user_data, :pointer,
             :close_callback, :lorcon_close,
             :open_inject_callback, :lorcon_open_inject,
             :open_monitor_callback, :lorcon_open_monitor,
             :open_inject_monitor_callback, :lorcon_open_inject_monitor,
             :set_channel_callback, :lorcon_set_channel,
             :get_channel_callback, :lorcon_get_channel,
             :send_packet_callback, :lorcon_send_packet,
             :get_packet_callback, :lorcon_get_packet,
             :set_dlt_callback, :lorcon_set_dlt,
             :get_dlt_callback, :lorcon_get_dlt,
             :wep_keys, :pointer

      def wep_keys
        WEP.new(self[:wep_keys])
      end

    end
  end
end
