require 'lorcon-ffi/version'

require 'spec_helper'

describe Lorcon do
  it "should define a VERSION constant" do
    Lorcon.const_defined?('VERSION').should == true
  end
end
