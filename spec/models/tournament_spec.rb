require File.dirname(__FILE__) + '/../spec_helper'

describe Tournament do
  before(:each) do
    @tournament = Tournament.new
  end

  it "should not be valid" do
    @tournament.should_not be_valid
  end
end
