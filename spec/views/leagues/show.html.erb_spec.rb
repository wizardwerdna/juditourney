require File.dirname(__FILE__) + '/../../spec_helper'

describe "/leagues/show.html.erb" do
  include LeaguesHelper
  
  before(:each) do
    @league = mock_model(League)
    @league.stub!(:name).and_return("MyString")
    @league.stub!(:description).and_return("MyText")
    
    # assigns[:league] = @league
  end

  it "should render attributes in <p>" do
    # render "/leagues/show.html.erb"
    # response.should have_text(/MyString/)
    # response.should have_text(/MyText/)
  end
end

