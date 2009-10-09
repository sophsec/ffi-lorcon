require 'lorcon-ffi/lorcon'
require 'lorcon-ffi/version'

require 'spec_helper'

describe Lorcon do
  it "should define a VERSION constant" do
    Lorcon.const_defined?('VERSION').should == true
  end

  it "should have an internal LORCON version" do
    Lorcon.lorcon_get_version.should_not == 0
  end

  it "should list the available drivers" do
    drivers = Lorcon.list_drivers

    drivers.should_not be_empty
  end

  it "should find the driver with a specified name" do
    driver = Lorcon.find_driver('mac80211')

    driver.should_not be_nil
    driver.should_not be_null
    driver.name.should == 'mac80211'
  end

  it "should provide a default driver for the interface" do
    driver = Lorcon.default_driver(IFACE)

    driver.should_not be_nil
    driver.should_not be_null
    driver.name.should_not be_empty
  end
end
