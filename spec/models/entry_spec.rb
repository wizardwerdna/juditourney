require File.dirname(__FILE__) + '/../spec_helper'

describe Entry do

  before(:each) do
    @entry = Entry.new
  end

  it "should not be valid" do
    @entry.should_not be_valid
  end
end
