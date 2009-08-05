require 'lorcon-ffi/ffi'
require 'lorcon-ffi/version'

require 'spec_helper'

describe Lorcon do
  it "should define a VERSION constant" do
    Lorcon.const_defined?('VERSION').should == true
  end

  it "should have an internal LORCON version" do
    Lorcon.tx80211_getversion.should_not == 0
  end
end
