require File.dirname(__FILE__) + '/../../spec_helper'

describe "/players/edit.html.erb" do
  include PlayersHelper
  
  before do
    @player = mock_model(Player)
    @player.stub!(:first).and_return("MyString")
    @player.stub!(:last).and_return("MyString")
    @player.stub!(:image_url).and_return("MyString")
    @player.stub!(:description).and_return("MyText")
    assigns[:player] = @player
  end

  it "should render edit form" do
    render "/players/edit.html.erb"
    
    response.should have_tag("form[action=#{player_path(@player)}][method=post]") do
      with_tag('input#player_first[name=?]', "player[first]")
      with_tag('input#player_last[name=?]', "player[last]")
      with_tag('input#player_image_url[name=?]', "player[image_url]")
      with_tag('textarea#player_description[name=?]', "player[description]")
    end
  end
end


