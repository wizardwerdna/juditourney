require File.dirname(__FILE__) + '/../spec_helper'

describe LeaguesController do
  describe "route generation" do

    it "should map { :controller => 'leagues', :action => 'index' } to /leagues" do
      route_for(:controller => "leagues", :action => "index").should == "/leagues"
    end
  
    it "should map { :controller => 'leagues', :action => 'new' } to /leagues/new" do
      route_for(:controller => "leagues", :action => "new").should == "/leagues/new"
    end
  
    it "should map { :controller => 'leagues', :action => 'show', :id => 1 } to /leagues/1" do
      route_for(:controller => "leagues", :action => "show", :id => 1).should == "/leagues/1"
    end
  
    it "should map { :controller => 'leagues', :action => 'edit', :id => 1 } to /leagues/1/edit" do
      route_for(:controller => "leagues", :action => "edit", :id => 1).should == "/leagues/1/edit"
    end
  
    it "should map { :controller => 'leagues', :action => 'update', :id => 1} to /leagues/1" do
      route_for(:controller => "leagues", :action => "update", :id => 1).should == "/leagues/1"
    end
  
    it "should map { :controller => 'leagues', :action => 'destroy', :id => 1} to /leagues/1" do
      route_for(:controller => "leagues", :action => "destroy", :id => 1).should == "/leagues/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'leagues', action => 'index' } from GET /leagues" do
      params_from(:get, "/leagues").should == {:controller => "leagues", :action => "index"}
    end
  
    it "should generate params { :controller => 'leagues', action => 'new' } from GET /leagues/new" do
      params_from(:get, "/leagues/new").should == {:controller => "leagues", :action => "new"}
    end
  
    it "should generate params { :controller => 'leagues', action => 'create' } from POST /leagues" do
      params_from(:post, "/leagues").should == {:controller => "leagues", :action => "create"}
    end
  
    it "should generate params { :controller => 'leagues', action => 'show', id => '1' } from GET /leagues/1" do
      params_from(:get, "/leagues/1").should == {:controller => "leagues", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'leagues', action => 'edit', id => '1' } from GET /leagues/1;edit" do
      params_from(:get, "/leagues/1/edit").should == {:controller => "leagues", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'leagues', action => 'update', id => '1' } from PUT /leagues/1" do
      params_from(:put, "/leagues/1").should == {:controller => "leagues", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'leagues', action => 'destroy', id => '1' } from DELETE /leagues/1" do
      params_from(:delete, "/leagues/1").should == {:controller => "leagues", :action => "destroy", :id => "1"}
    end
  end
end