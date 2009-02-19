require File.dirname(__FILE__) + '/../../spec_helper'

describe "/players/show.html.erb" do
  include PlayersHelper
  
  before(:each) do
    @player = mock_model(Player)
    @player.stub!(:first).and_return("MyString")
    @player.stub!(:last).and_return("MyString")
    @player.stub!(:image_url).and_return("MyString")
    @player.stub!(:description).and_return("MyText")
    @player.stub!(:full_name).and_return("MyString")
    
    # assigns[:player] = @player
  end

  it "should render attributes in <p>" do
    # render "/players/show.html.erb"
    # response.should have_text(/MyString/)
    # response.should have_text(/MyString/)
    # response.should have_text(/MyString/)
    # response.should have_text(/MyText/)
  end
end

