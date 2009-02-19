require File.dirname(__FILE__) + '/../../spec_helper'

describe "/players/new.html.erb" do
  include PlayersHelper
  
  before(:each) do
    @errors = mock_model(ActiveRecord::Errors)
    @errors.stub!(:count).and_return(0)
    @errors.stub!(:empty?).and_return(true)
    @player = mock_model(Player)
    @player.stub!(:new_record?).and_return(true)
    @player.stub!(:first).and_return("MyString")
    @player.stub!(:last).and_return("MyString")
    @player.stub!(:image_url).and_return("MyString")
    @player.stub!(:description).and_return("MyText")
    @player.stub!(:errors).and_return(@errors)
    assigns[:player] = @player
  end

  it "should render new form" do
    render "/players/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", players_path) do
      with_tag("input#player_first[name=?]", "player[first]")
      with_tag("input#player_last[name=?]", "player[last]")
      with_tag("input#player_image_url[name=?]", "player[image_url]")
      with_tag("textarea#player_description[name=?]", "player[description]")
    end
  end
end


