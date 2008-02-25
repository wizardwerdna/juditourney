require File.dirname(__FILE__) + '/../spec_helper'

describe TournamentsController do
  describe "route generation" do

    it "should map { :controller => 'tournaments', :action => 'index' } to /tournaments" do
      route_for(:controller => "tournaments", :action => "index").should == "/tournaments"
    end
  
    it "should map { :controller => 'tournaments', :action => 'new' } to /tournaments/new" do
      route_for(:controller => "tournaments", :action => "new").should == "/tournaments/new"
    end
  
    it "should map { :controller => 'tournaments', :action => 'show', :id => 1 } to /tournaments/1" do
      route_for(:controller => "tournaments", :action => "show", :id => 1).should == "/tournaments/1"
    end
  
    it "should map { :controller => 'tournaments', :action => 'edit', :id => 1 } to /tournaments/1/edit" do
      route_for(:controller => "tournaments", :action => "edit", :id => 1).should == "/tournaments/1/edit"
    end
  
    it "should map { :controller => 'tournaments', :action => 'update', :id => 1} to /tournaments/1" do
      route_for(:controller => "tournaments", :action => "update", :id => 1).should == "/tournaments/1"
    end
  
    it "should map { :controller => 'tournaments', :action => 'destroy', :id => 1} to /tournaments/1" do
      route_for(:controller => "tournaments", :action => "destroy", :id => 1).should == "/tournaments/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'tournaments', action => 'index' } from GET /tournaments" do
      params_from(:get, "/tournaments").should == {:controller => "tournaments", :action => "index"}
    end
  
    it "should generate params { :controller => 'tournaments', action => 'new' } from GET /tournaments/new" do
      params_from(:get, "/tournaments/new").should == {:controller => "tournaments", :action => "new"}
    end
  
    it "should generate params { :controller => 'tournaments', action => 'create' } from POST /tournaments" do
      params_from(:post, "/tournaments").should == {:controller => "tournaments", :action => "create"}
    end
  
    it "should generate params { :controller => 'tournaments', action => 'show', id => '1' } from GET /tournaments/1" do
      params_from(:get, "/tournaments/1").should == {:controller => "tournaments", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'tournaments', action => 'edit', id => '1' } from GET /tournaments/1;edit" do
      params_from(:get, "/tournaments/1/edit").should == {:controller => "tournaments", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'tournaments', action => 'update', id => '1' } from PUT /tournaments/1" do
      params_from(:put, "/tournaments/1").should == {:controller => "tournaments", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'tournaments', action => 'destroy', id => '1' } from DELETE /tournaments/1" do
      params_from(:delete, "/tournaments/1").should == {:controller => "tournaments", :action => "destroy", :id => "1"}
    end
  end
end