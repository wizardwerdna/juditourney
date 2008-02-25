require File.dirname(__FILE__) + '/../../spec_helper'

describe "/leagues/index.html.erb" do
  include LeaguesHelper
  
  before(:each) do
  #   league_98 = mock_model(League)
  #   league_98.should_receive(:name).and_return("MyString")
  #   league_98.should_receive(:description).and_return("MyText")
  #   league_99 = mock_model(League)
  #   league_99.should_receive(:name).and_return("MyString")
  #   league_99.should_receive(:description).and_return("MyText")
  # 
  #   assigns[:leagues] = [league_98, league_99]
  end
  # 
  it "should render list of leagues" do
  #   render "/leagues/index.html.erb"
  #   response.should have_tag("tr>td", "MyString", 2)
  #   response.should have_tag("tr>td", "MyText", 2)
  end
end

