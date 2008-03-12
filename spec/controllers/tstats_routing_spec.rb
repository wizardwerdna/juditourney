require File.dirname(__FILE__) + '/../spec_helper'

describe TstatsController do
  describe "route generation" do

    it "should map { :controller => 'tstats', :action => 'index' } to /tstats" do
      route_for(:controller => "tstats", :action => "index").should == "/tstats"
    end
  
    it "should map { :controller => 'tstats', :action => 'new' } to /tstats/new" do
      route_for(:controller => "tstats", :action => "new").should == "/tstats/new"
    end
  
    it "should map { :controller => 'tstats', :action => 'show', :id => 1 } to /tstats/1" do
      route_for(:controller => "tstats", :action => "show", :id => 1).should == "/tstats/1"
    end
  
    it "should map { :controller => 'tstats', :action => 'edit', :id => 1 } to /tstats/1/edit" do
      route_for(:controller => "tstats", :action => "edit", :id => 1).should == "/tstats/1/edit"
    end
  
    it "should map { :controller => 'tstats', :action => 'update', :id => 1} to /tstats/1" do
      route_for(:controller => "tstats", :action => "update", :id => 1).should == "/tstats/1"
    end
  
    it "should map { :controller => 'tstats', :action => 'destroy', :id => 1} to /tstats/1" do
      route_for(:controller => "tstats", :action => "destroy", :id => 1).should == "/tstats/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'tstats', action => 'index' } from GET /tstats" do
      params_from(:get, "/tstats").should == {:controller => "tstats", :action => "index"}
    end
  
    it "should generate params { :controller => 'tstats', action => 'new' } from GET /tstats/new" do
      params_from(:get, "/tstats/new").should == {:controller => "tstats", :action => "new"}
    end
  
    it "should generate params { :controller => 'tstats', action => 'create' } from POST /tstats" do
      params_from(:post, "/tstats").should == {:controller => "tstats", :action => "create"}
    end
  
    it "should generate params { :controller => 'tstats', action => 'show', id => '1' } from GET /tstats/1" do
      params_from(:get, "/tstats/1").should == {:controller => "tstats", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'tstats', action => 'edit', id => '1' } from GET /tstats/1;edit" do
      params_from(:get, "/tstats/1/edit").should == {:controller => "tstats", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'tstats', action => 'update', id => '1' } from PUT /tstats/1" do
      params_from(:put, "/tstats/1").should == {:controller => "tstats", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'tstats', action => 'destroy', id => '1' } from DELETE /tstats/1" do
      params_from(:delete, "/tstats/1").should == {:controller => "tstats", :action => "destroy", :id => "1"}
    end
  end
end