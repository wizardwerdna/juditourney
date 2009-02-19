require File.dirname(__FILE__) + '/../spec_helper'

describe League do
  before(:each) do
    @league = League.new
  end

  it "should not be valid" do
    @league.should_not be_valid
  end
end
