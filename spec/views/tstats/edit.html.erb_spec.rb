require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tstats/edit.html.erb" do
  include TstatsHelper
  
  before do
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

  it "should render edit form" do
    render "/tstats/edit.html.erb"
    
    response.should have_tag("form[action=#{tstat_path(@tstat)}][method=post]") do
      with_tag('input#tstat_hero_chips[name=?]', "tstat[hero_chips]")
      with_tag('input#tstat_small_blind[name=?]', "tstat[small_blind]")
      with_tag('input#tstat_big_blind[name=?]', "tstat[big_blind]")
      with_tag('input#tstat_ante[name=?]', "tstat[ante]")
      with_tag('input#tstat_current_table_size[name=?]', "tstat[current_table_size]")
      with_tag('input#tstat_number_of_players_left[name=?]', "tstat[number_of_players_left]")
      with_tag('input#tstat_number_of_players_at_start[name=?]', "tstat[number_of_players_at_start]")
      with_tag('input#tstat_starting_chips[name=?]', "tstat[starting_chips]")
      with_tag('input#tstat_added_chips[name=?]', "tstat[added_chips]")
      with_tag('input#tstat_maximum_table_size[name=?]', "tstat[maximum_table_size]")
    end
  end
end


