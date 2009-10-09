require 'lorcon-ffi/ffi'
require 'lorcon-ffi/driver'
require 'lorcon-ffi/driver_list'

module FFI
  module Lorcon
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
