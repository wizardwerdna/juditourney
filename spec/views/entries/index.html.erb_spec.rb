require File.dirname(__FILE__) + '/../../spec_helper'

describe "/entries/index.html.erb" do
  include EntriesHelper
  
  before(:each) do
    player_98 = mock_model(Player)
    player_98.should_receive(:full_name).and_return("John Smith")
    league_98 = mock_model(League)
    league_98.should_receive(:name).and_return("League Name")
    tournament_98 = mock_model(Tournament)
    tournament_98.should_receive(:league).and_return(league_98)
    tournament_98.should_receive(:formatted_start).and_return(DateTime.now.to_s)
    entry_98 = mock_model(Entry)
    entry_98.should_receive(:tournament).any_number_of_times.and_return(tournament_98)
    entry_98.should_receive(:player).and_return(player_98)
    entry_98.should_receive(:paid).and_return("1")
    entry_98.should_receive(:result).and_return("1")
    entry_98.should_receive(:payout).and_return("1")



    player_99 = mock_model(Player)
    player_99.should_receive(:full_name).and_return("John Smith")
    league_99 = mock_model(League)
    league_99.should_receive(:name).and_return("League Name")
    tournament_99 = mock_model(Tournament)
    tournament_99.should_receive(:league).and_return(league_99)
    tournament_99.should_receive(:formatted_start).and_return(DateTime.now.to_s)
    entry_99 = mock_model(Entry)
    entry_99.should_receive(:tournament).any_number_of_times.and_return(tournament_99)
    entry_99.should_receive(:player).and_return(player_99)
    entry_99.should_receive(:paid).and_return("1")
    entry_99.should_receive(:result).and_return("1")
    entry_99.should_receive(:payout).and_return("1")

    assigns[:entries] = [entry_98, entry_99]
  end

  it "should render list of entries" do
    render "/entries/index.html.erb"
    # response.should have_tag("tr>td", "1", 2)
    # response.should have_tag("tr>td", "1", 2)
    # response.should have_tag("tr>td", "1", 2)
  end
end

