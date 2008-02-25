require File.dirname(__FILE__) + '/../spec_helper'

describe Player do
  before(:each) do
    @player = Player.new
  end

  it "should not be valid" do
    @player.should_not be_valid
  end
end
