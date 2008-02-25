require File.dirname(__FILE__) + '/../../spec_helper'

describe "/leagues/edit.html.erb" do
  include LeaguesHelper
  
  before do
    @league = mock_model(League)
    @league.stub!(:name).and_return("MyString")
    @league.stub!(:description).and_return("MyText")
    assigns[:league] = @league
  end

  it "should render edit form" do
    render "/leagues/edit.html.erb"
    
    response.should have_tag("form[action=#{league_path(@league)}][method=post]") do
      with_tag('input#league_name[name=?]', "league[name]")
      with_tag('textarea#league_description[name=?]', "league[description]")
    end
  end
end


