require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tstats/show.html.erb" do
  include TstatsHelper
  
  before(:each) do
    @tstat = mock_model(Tstat)
    @tstat.stub!(:hero_chips).and_return("1")
    @tstat.stub!(:small_blind).and_return("1")
    @tstat.stub!(:big_blind).and_return("1")
    @tstat.stub!(:ante).and_return("1")
    @tstat.stub!(:current_table_size).and_return("1")
    @tstat.stub!(:number_of_players_left).and_return("1")
    @tstat.stub!(:number_of_players_at_start).and_return("1")
    @tstat.stub!(:starting_chips).and_return("1")
    @tstat.stub!(:added_chips).and_return("1")
    @tstat.stub!(:maximum_table_size).and_return("1")

    assigns[:tstat] = @tstat
  end

  it "should render attributes in <p>" do
    render "/tstats/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

