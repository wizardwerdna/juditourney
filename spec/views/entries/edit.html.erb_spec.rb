require File.dirname(__FILE__) + '/../../spec_helper'

describe "/entries/edit.html.erb" do
  include EntriesHelper
  
  before do
    @entry = mock_model(Entry)
    @entry.stub!(:tournament_id).and_return("1")
    @entry.stub!(:player_id).and_return("1")
    @entry.stub!(:paid).and_return("1")
    @entry.stub!(:result).and_return("1")
    @entry.stub!(:payout).and_return("1")
    assigns[:entry] = @entry
  end

  it "should render edit form" do
    render "/entries/edit.html.erb"
    
    response.should have_tag("form[action=#{entry_path(@entry)}][method=post]") do
      with_tag('input#entry_paid[name=?]', "entry[paid]")
      with_tag('input#entry_result[name=?]', "entry[result]")
      with_tag('input#entry_payout[name=?]', "entry[payout]")
    end
  end
end


