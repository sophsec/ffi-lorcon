require 'lorcon-ffi/typedefs'

require 'ffi'

module FFI
  module Lorcon
    extend FFI::Library

    ffi_lib 'liborcon'

    attach_function :tx80211_getversion, [], :string
  end
end
