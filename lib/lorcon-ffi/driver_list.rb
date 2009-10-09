require 'lorcon-ffi/driver'

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
