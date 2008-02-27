require File.dirname(__FILE__) + '/../spec_helper'

describe Player do
  before(:each) do
    @player = Player.new
  end

  it "should not be valid" do
    @player.should_not be_valid
  end
  
  it "should properly handle assignment of 'Cher' to full_name" do
    @player.full_name = "Andy"
    @player.first.should be_blank
    @player.last.should == "Andy"
    @player.full_name.should == "Andy"
  end
  
  it "should properly handle assignment of 'Judi Glidewell' to full_name" do
    @player.full_name = "Judi Glidewell"
    @player.first.should == "Judi"
    @player.last.should == "Glidewell"
    @player.full_name.should == "Judi Glidewell"
  end
  
  it "should properly handle assignment of 'Andrew C. Greenberg' to full_name" do
    @player.full_name = "Andrew C. Greenberg"
    @player.first.should == "Andrew C."
    @player.last.should == "Greenberg"
    @player.full_name.should == "Andrew C. Greenberg"
  end
  
  it "should properly compute last name whenever first is blank" do
    @player.last = "fred"
    @player.full_name.should == "fred"
  end
  
  it "should properly compute last name whenever first and last are not blank" do
    @player.first = "Andrew C."
    @player.last = "Greenberg"
    @player.full_name.should == "Andrew C. Greenberg"
  end
  
  it "should properly create an image_url_link" do
    @player.image_url = "http://foo.com"
    @player.image_url_link.should == '<IMG SRC="http://foo.com" />'
  end
  
end
