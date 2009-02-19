require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tournaments/index.html.erb" do
  include TournamentsHelper
  
  # before(:each) do
     # tournament_98 = mock_model(Tournament)
    # tournament_98.should_receive(:league_id).and_return("1")
    # tournament_98.should_receive(:start).and_return("MyString")
    # tournament_98.should_receive(:description).and_return("MyText")
    # tournament_98.should_receive(:buyin).and_return("1")
    # tournament_99 = mock_model(Tournament)
    # tournament_99.should_receive(:league_id).and_return("1")
    # tournament_99.should_receive(:start).and_return("MyString")
    # tournament_99.should_receive(:description).and_return("MyText")
    # tournament_99.should_receive(:buyin).and_return("1")
    # 
    # assigns[:tournaments] = [tournament_98, tournament_99]
  # end

  # it "should render list of tournaments" do
    # render "/tournaments/index.html.erb"
    # response.should have_tag("tr>td", "MyString", 2)
    # response.should have_tag("tr>td", "MyText", 2)
    # response.should have_tag("tr>td", "1", 2)
  # end
end

