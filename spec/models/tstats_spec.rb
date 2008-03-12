require File.dirname(__FILE__) + '/../spec_helper'

describe Tstats do
  before(:each) do
    @tstats = Tstats.new
  end

  it "should be valid" do
    @tstats.should be_valid
  end
end
