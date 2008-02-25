require File.dirname(__FILE__) + '/../../spec_helper'

describe "/entries/new.html.erb" do
  include EntriesHelper
  
  before(:each) do
    @entry = mock_model(Entry)
    @entry.stub!(:new_record?).and_return(true)
    @entry.stub!(:tournament_id).and_return("1")
    @entry.stub!(:player_id).and_return("1")
    @entry.stub!(:paid).and_return("1")
    @entry.stub!(:result).and_return("1")
    @entry.stub!(:payout).and_return("1")
    assigns[:entry] = @entry
  end

  it "should render new form" do
    render "/entries/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", entries_path) do
      with_tag("input#entry_paid[name=?]", "entry[paid]")
      with_tag("input#entry_result[name=?]", "entry[result]")
      with_tag("input#entry_payout[name=?]", "entry[payout]")
    end
  end
end


