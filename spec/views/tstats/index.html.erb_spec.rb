require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tstats/index.html.erb" do
  include TstatsHelper
  
  before(:each) do
    tstat_98 = mock_model(Tstat)
    tstat_98.should_receive(:hero_chips).and_return("1")
    tstat_98.should_receive(:small_blind).and_return("1")
    tstat_98.should_receive(:big_blind).and_return("1")
    tstat_98.should_receive(:ante).and_return("1")
    tstat_98.should_receive(:current_table_size).and_return("1")
    tstat_98.should_receive(:number_of_players_left).and_return("1")
    tstat_98.should_receive(:number_of_players_at_start).and_return("1")
    tstat_98.should_receive(:starting_chips).and_return("1")
    tstat_98.should_receive(:added_chips).and_return("1")
    tstat_98.should_receive(:maximum_table_size).and_return("1")
    tstat_99 = mock_model(Tstat)
    tstat_99.should_receive(:hero_chips).and_return("1")
    tstat_99.should_receive(:small_blind).and_return("1")
    tstat_99.should_receive(:big_blind).and_return("1")
    tstat_99.should_receive(:ante).and_return("1")
    tstat_99.should_receive(:current_table_size).and_return("1")
    tstat_99.should_receive(:number_of_players_left).and_return("1")
    tstat_99.should_receive(:number_of_players_at_start).and_return("1")
    tstat_99.should_receive(:starting_chips).and_return("1")
    tstat_99.should_receive(:added_chips).and_return("1")
    tstat_99.should_receive(:maximum_table_size).and_return("1")

    assigns[:tstats] = [tstat_98, tstat_99]
  end

  it "should render list of tstats" do
    render "/tstats/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

