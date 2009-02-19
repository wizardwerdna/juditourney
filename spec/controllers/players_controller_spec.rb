require File.dirname(__FILE__) + '/../spec_helper'

describe PlayersController do
  include AuthenticatedTestHelper
  
  before(:each) do
    juditourney_login
  end
  
  describe "handling POST /auto_complete_for_player_full_name" do

    before(:each) do
      @player.stub!(:full_name).and_return("Wizzy Beaver")
    end

    it "should be successful" do
      post :auto_complete_for_player_full_name, :player => {:full_name => "this is a test"}
      response.should be_success
    end
      
    it "should render the autocomplete partial" do
       post :auto_complete_for_player_full_name, :player => {:full_name => "this is a test"}
       response.should render_template('_player_full_name')
    end
    
    it "should find all the players" do
      Player.should_receive(:find).with(:all, {:order => "last, first"}).and_return([@player])
      post :auto_complete_for_player_full_name, :player => {:full_name => "this is a test"}
    end
    
  end

  describe "handling GET /players" do

    before(:each) do
      @player = mock_model(Player)
      Player.stub!(:find).and_return([@player])
      @player.stub!(:full_name).and_return("Wizzy Beaver")
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all players" do
      Player.should_receive(:find).with(:all, {:order => "last, first"}).and_return([@player])
      do_get
    end
  
    it "should assign the found players for the view" do
      do_get
      assigns[:players].should == [@player]
    end
  end

  describe "handling GET /players.xml" do

    before(:each) do
      @player = mock_model(Player, :to_xml => "XML")
      Player.stub!(:find).and_return(@player)
      @player.stub!(:full_name).and_return("Wizzy Beaver")
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all players" do
      Player.should_receive(:find).with(:all, {:order => "last, first"}).and_return([@player])
      do_get
    end
  
    it "should render the found players as xml" do
      @player.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /players/1" do

    before(:each) do
      @player = mock_model(Player)
      @player.stub!(:full_name).and_return("Wizzy beaver")
      Player.stub!(:find).and_return(@player)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the player requested" do
      Player.should_receive(:find).with("1").and_return(@player)
      do_get
    end
  
    it "should assign the found player for the view" do
      do_get
      assigns[:player].should equal(@player)
    end
  end

  describe "handling GET /players/1.xml" do

    before(:each) do
      @player = mock_model(Player, :to_xml => "XML")
      @player.stub!(:full_name).and_return("Wizzy Beaver")
      Player.stub!(:find).and_return(@player)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the player requested" do
      Player.should_receive(:find).with("1").and_return(@player)
      do_get
    end
  
    it "should render the found player as xml" do
      @player.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /players/new" do

    before(:each) do
      @player = mock_model(Player)
      Player.stub!(:new).and_return(@player)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new player" do
      Player.should_receive(:new).and_return(@player)
      do_get
    end
  
    it "should not save the new player" do
      @player.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new player for the view" do
      do_get
      assigns[:player].should equal(@player)
    end
  end

  describe "handling GET /players/1/edit" do

    before(:each) do
      @player = mock_model(Player, :full_name => "MyString")
      Player.stub!(:find).and_return(@player)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the player requested" do
      Player.should_receive(:find).and_return(@player)
      do_get
    end
  
    it "should assign the found Player for the view" do
      do_get
      assigns[:player].should equal(@player)
    end
  end

  describe "handling POST /players" do

    before(:each) do
      @player = mock_model(Player, :to_param => "1")
      Player.stub!(:new).and_return(@player)
    end
    
    describe "with successful save" do
  
      def do_post
        @player.should_receive(:save).and_return(true)
        post :create, :player => {}
      end
  
      it "should create a new player" do
        Player.should_receive(:new).with({}).and_return(@player)
        do_post
      end

      it "should redirect to the new player" do
        do_post
        response.should redirect_to(player_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @player.should_receive(:save).and_return(false)
        post :create, :player => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /players/1" do

    before(:each) do
      @player = mock_model(Player, :to_param => "1")
      Player.stub!(:find).and_return(@player)
    end
    
    describe "with successful update" do

      def do_put
        @player.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the player requested" do
        Player.should_receive(:find).with("1").and_return(@player)
        do_put
      end

      it "should update the found player" do
        do_put
        assigns(:player).should equal(@player)
      end

      it "should assign the found player for the view" do
        do_put
        assigns(:player).should equal(@player)
      end

      it "should redirect to the player" do
        do_put
        response.should redirect_to(player_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @player.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /players/1" do

    before(:each) do
      @player = mock_model(Player, :destroy => true)
      Player.stub!(:find).and_return(@player)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the player requested" do
      Player.should_receive(:find).with("1").and_return(@player)
      do_delete
    end
  
    it "should call destroy on the found player" do
      @player.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the players list" do
      do_delete
      response.should redirect_to(players_url)
    end
  end
end