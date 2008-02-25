require File.dirname(__FILE__) + '/../spec_helper'

describe PlayersController do
  describe "route generation" do

    it "should map { :controller => 'players', :action => 'index' } to /players" do
      route_for(:controller => "players", :action => "index").should == "/players"
    end
  
    it "should map { :controller => 'players', :action => 'new' } to /players/new" do
      route_for(:controller => "players", :action => "new").should == "/players/new"
    end
  
    it "should map { :controller => 'players', :action => 'show', :id => 1 } to /players/1" do
      route_for(:controller => "players", :action => "show", :id => 1).should == "/players/1"
    end
  
    it "should map { :controller => 'players', :action => 'edit', :id => 1 } to /players/1/edit" do
      route_for(:controller => "players", :action => "edit", :id => 1).should == "/players/1/edit"
    end
  
    it "should map { :controller => 'players', :action => 'update', :id => 1} to /players/1" do
      route_for(:controller => "players", :action => "update", :id => 1).should == "/players/1"
    end
  
    it "should map { :controller => 'players', :action => 'destroy', :id => 1} to /players/1" do
      route_for(:controller => "players", :action => "destroy", :id => 1).should == "/players/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'players', action => 'index' } from GET /players" do
      params_from(:get, "/players").should == {:controller => "players", :action => "index"}
    end
  
    it "should generate params { :controller => 'players', action => 'new' } from GET /players/new" do
      params_from(:get, "/players/new").should == {:controller => "players", :action => "new"}
    end
  
    it "should generate params { :controller => 'players', action => 'create' } from POST /players" do
      params_from(:post, "/players").should == {:controller => "players", :action => "create"}
    end
  
    it "should generate params { :controller => 'players', action => 'show', id => '1' } from GET /players/1" do
      params_from(:get, "/players/1").should == {:controller => "players", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'players', action => 'edit', id => '1' } from GET /players/1;edit" do
      params_from(:get, "/players/1/edit").should == {:controller => "players", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'players', action => 'update', id => '1' } from PUT /players/1" do
      params_from(:put, "/players/1").should == {:controller => "players", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'players', action => 'destroy', id => '1' } from DELETE /players/1" do
      params_from(:delete, "/players/1").should == {:controller => "players", :action => "destroy", :id => "1"}
    end
  end
end