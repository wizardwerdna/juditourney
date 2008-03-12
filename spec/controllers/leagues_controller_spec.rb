require File.dirname(__FILE__) + '/../spec_helper'

describe LeaguesController do
  include AuthenticatedTestHelper
  
  before(:each) do
    juditourney_login
  end

  describe "handling GET /leagues" do

    before(:each) do
      @league = mock_model(League)
      League.stub!(:find).and_return([@league])
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
  
    it "should find all leagues" do
      League.should_receive(:find).with(:all).and_return([@league])
      do_get
    end
  
    it "should assign the found leagues for the view" do
      do_get
      assigns[:leagues].should == [@league]
    end
  end

  describe "handling GET /leagues.xml" do

    before(:each) do
      @league = mock_model(League, :to_xml => "XML")
      League.stub!(:find).and_return(@league)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all leagues" do
      League.should_receive(:find).with(:all).and_return([@league])
      do_get
    end
  
    it "should render the found leagues as xml" do
      @league.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /leagues/1" do

    before(:each) do
      @league = mock_model(League)
      @league.stub!(:name).and_return("league_name")
      @league.stub!(:detail_report_data ).and_return({:players=>nil, :tournaments=>nil})
      League.stub!(:find).and_return(@league)
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
  
    it "should find the league requested" do
      League.should_receive(:find).with("1").and_return(@league)
      do_get
    end
  
    it "should assign the found league for the view" do
      do_get
      assigns[:league].should equal(@league)
    end
  end

  describe "handling GET /leagues/1.xml" do

    before(:each) do
      @league = mock_model(League, :to_xml => "XML")
      @league.stub!(:name).and_return("league_name")
      @league.stub!(:detail_report_data ).and_return({:players=>nil, :tournaments=>nil})
      League.stub!(:find).and_return(@league)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the league requested" do
      League.should_receive(:find).with("1").and_return(@league)
      do_get
    end
  
    it "should render the found league as xml" do
      @league.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /leagues/new" do

    before(:each) do
      @league = mock_model(League)
      League.stub!(:new).and_return(@league)
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
  
    it "should create an new league" do
      League.should_receive(:new).and_return(@league)
      do_get
    end
  
    it "should not save the new league" do
      @league.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new league for the view" do
      do_get
      assigns[:league].should equal(@league)
    end
  end

  describe "handling GET /leagues/1/edit" do

    before(:each) do
      @league = mock_model(League)
      League.stub!(:find).and_return(@league)
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
  
    it "should find the league requested" do
      League.should_receive(:find).and_return(@league)
      do_get
    end
  
    it "should assign the found League for the view" do
      do_get
      assigns[:league].should equal(@league)
    end
  end

  describe "handling POST /leagues" do

    before(:each) do
      @league = mock_model(League, :to_param => "1")
      League.stub!(:new).and_return(@league)
    end
    
    describe "with successful save" do
  
      def do_post
        @league.should_receive(:save).and_return(true)
        post :create, :league => {}
      end
  
      it "should create a new league" do
        League.should_receive(:new).with({}).and_return(@league)
        do_post
      end

      it "should redirect to the new league" do
        do_post
        response.should redirect_to(league_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @league.should_receive(:save).and_return(false)
        post :create, :league => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /leagues/1" do

    before(:each) do
      @league = mock_model(League, :to_param => "1")
      League.stub!(:find).and_return(@league)
    end
    
    describe "with successful update" do

      def do_put
        @league.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the league requested" do
        League.should_receive(:find).with("1").and_return(@league)
        do_put
      end

      it "should update the found league" do
        do_put
        assigns(:league).should equal(@league)
      end

      it "should assign the found league for the view" do
        do_put
        assigns(:league).should equal(@league)
      end

      it "should redirect to the league" do
        do_put
        response.should redirect_to(league_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @league.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /leagues/1" do

    before(:each) do
      @league = mock_model(League, :destroy => true)
      League.stub!(:find).and_return(@league)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the league requested" do
      League.should_receive(:find).with("1").and_return(@league)
      do_delete
    end
  
    it "should call destroy on the found league" do
      @league.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the leagues list" do
      do_delete
      response.should redirect_to(leagues_url)
    end
  end
end