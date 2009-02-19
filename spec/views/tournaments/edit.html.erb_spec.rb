require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tournaments/edit.html.erb" do
  include TournamentsHelper
  
  # before do
  #   @tournament = mock_model(Tournament)
  #   @tournament.stub!(:league_id).and_return("1")
  #   @tournament.stub!(:start).and_return(Datetime.now)
  #   @tournament.stub!(:description).and_return("MyText")
  #   @tournament.stub!(:buyin).and_return("1")
  #   assigns[:tournament] = @tournament
  # end
  # 
  # it "should render edit form" do
  #   render "/tournaments/edit.html.erb"
  #   
  #   response.should have_tag("form[action=#{tournament_path(@tournament)}][method=post]") do
  #     with_tag('input#tournament_start[name=?]', "tournament[start]")
  #     with_tag('textarea#tournament_description[name=?]', "tournament[description]")
  #     with_tag('input#tournament_buyin[name=?]', "tournament[buyin]")
  #   end
  # end
end


