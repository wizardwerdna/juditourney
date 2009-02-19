require File.dirname(__FILE__) + '/../../spec_helper'

describe "/leagues/new.html.erb" do
  include LeaguesHelper
  
  before(:each) do
    @league = mock_model(League)
    @league.stub!(:new_record?).and_return(true)
    @league.stub!(:name).and_return("MyString")
    @league.stub!(:description).and_return("MyText")
    @errors = mock_model(ActiveRecord::Errors)
    @errors.stub!(:count).and_return(0)
    @errors.stub!(:empty?).and_return(true)
    @league.stub!(:errors).and_return(@errors)
    assigns[:league] = @league
  end

  it "should render new form" do
    render "/leagues/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", leagues_path) do
      with_tag("input#league_name[name=?]", "league[name]")
      with_tag("textarea#league_description[name=?]", "league[description]")
    end
  end
end


