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
        while (next_driver = @driver.next)
          block.call(next_driver)
        end
      end

    end
  end
end
