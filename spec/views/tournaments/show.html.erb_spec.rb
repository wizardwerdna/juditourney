require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tournaments/show.html.erb" do
  include TournamentsHelper
  
  before(:each) do
    @tournament = mock_model(Tournament)
    @tournament.stub!(:league_id).and_return("1")
    @tournament.stub!(:start).and_return("MyString")
    @tournament.stub!(:description).and_return("MyText")
    @tournament.stub!(:buyin).and_return("1")

    # assigns[:tournament] = @tournament
  end

  it "should render attributes in <p>" do
    # render "/tournaments/show.html.erb"
    # response.should have_text(/MyString/)
    # response.should have_text(/MyText/)
    # response.should have_text(/1/)
  end
end

