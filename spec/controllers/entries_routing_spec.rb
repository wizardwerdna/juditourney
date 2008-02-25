require File.dirname(__FILE__) + '/../spec_helper'

describe EntriesController do
  describe "route generation" do

    it "should map { :controller => 'entries', :action => 'index' } to /entries" do
      route_for(:controller => "entries", :action => "index").should == "/entries"
    end
  
    it "should map { :controller => 'entries', :action => 'new' } to /entries/new" do
      route_for(:controller => "entries", :action => "new").should == "/entries/new"
    end
  
    it "should map { :controller => 'entries', :action => 'show', :id => 1 } to /entries/1" do
      route_for(:controller => "entries", :action => "show", :id => 1).should == "/entries/1"
    end
  
    it "should map { :controller => 'entries', :action => 'edit', :id => 1 } to /entries/1/edit" do
      route_for(:controller => "entries", :action => "edit", :id => 1).should == "/entries/1/edit"
    end
  
    it "should map { :controller => 'entries', :action => 'update', :id => 1} to /entries/1" do
      route_for(:controller => "entries", :action => "update", :id => 1).should == "/entries/1"
    end
  
    it "should map { :controller => 'entries', :action => 'destroy', :id => 1} to /entries/1" do
      route_for(:controller => "entries", :action => "destroy", :id => 1).should == "/entries/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'entries', action => 'index' } from GET /entries" do
      params_from(:get, "/entries").should == {:controller => "entries", :action => "index"}
    end
  
    it "should generate params { :controller => 'entries', action => 'new' } from GET /entries/new" do
      params_from(:get, "/entries/new").should == {:controller => "entries", :action => "new"}
    end
  
    it "should generate params { :controller => 'entries', action => 'create' } from POST /entries" do
      params_from(:post, "/entries").should == {:controller => "entries", :action => "create"}
    end
  
    it "should generate params { :controller => 'entries', action => 'show', id => '1' } from GET /entries/1" do
      params_from(:get, "/entries/1").should == {:controller => "entries", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'entries', action => 'edit', id => '1' } from GET /entries/1;edit" do
      params_from(:get, "/entries/1/edit").should == {:controller => "entries", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'entries', action => 'update', id => '1' } from PUT /entries/1" do
      params_from(:put, "/entries/1").should == {:controller => "entries", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'entries', action => 'destroy', id => '1' } from DELETE /entries/1" do
      params_from(:delete, "/entries/1").should == {:controller => "entries", :action => "destroy", :id => "1"}
    end
  end
end