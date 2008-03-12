require File.dirname(__FILE__) + '/../spec_helper'

describe Tstat do
  before(:each) do
    @tstat = Tstat.new
  end

  it "should be valid" do
    @tstat.should be_valid
  end
end
