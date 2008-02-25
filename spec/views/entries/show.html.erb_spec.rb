require File.dirname(__FILE__) + '/../../spec_helper'

describe "/entries/show.html.erb" do
  include EntriesHelper
  
  before(:each) do
    @entry = mock_model(Entry)
    @entry.stub!(:tournament).and_return("1")
    @entry.stub!(:player_id).and_return("1")
    @entry.stub!(:paid).and_return("1")
    @entry.stub!(:result).and_return("1")
    @entry.stub!(:payout).and_return("1")
    
    assigns[:entry] = @entry
  end

  it "should render attributes in <p>" do
    # render "/entries/show.html.erb"
    # response.should have_text(/1/)
    # response.should have_text(/1/)
    # response.should have_text(/1/)
  end
end

