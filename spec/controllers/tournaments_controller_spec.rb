require File.dirname(__FILE__) + '/../spec_helper'

describe TournamentsController do
  include AuthenticatedTestHelper
  
  before(:each) do
    juditourney_login
  end

  describe "handling GET /tournaments" do

    before(:each) do
      @tournament = mock_model(Tournament)
      Tournament.stub!(:find).and_return([@tournament])
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
  
    it "should find all tournaments" do
      Tournament.should_receive(:find).with(:all).and_return([@tournament])
      do_get
    end
  
    it "should assign the found tournaments for the view" do
      do_get
      assigns[:tournaments].should == [@tournament]
    end
  end

  describe "handling GET /tournaments.xml" do

    before(:each) do
      @tournament = mock_model(Tournament, :to_xml => "XML")
      Tournament.stub!(:find).and_return(@tournament)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all tournaments" do
      Tournament.should_receive(:find).with(:all).and_return([@tournament])
      do_get
    end
  
    it "should render the found tournaments as xml" do
      @tournament.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /tournaments/1" do

    before(:each) do
      @tournament = mock_model(Tournament)
      Tournament.stub!(:find).and_return(@tournament)
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
  
    it "should find the tournament requested" do
      Tournament.should_receive(:find).with("1").and_return(@tournament)
      do_get
    end
  
    it "should assign the found tournament for the view" do
      do_get
      assigns[:tournament].should equal(@tournament)
    end
  end

  describe "handling GET /tournaments/1.xml" do

    before(:each) do
      @tournament = mock_model(Tournament, :to_xml => "XML")
      Tournament.stub!(:find).and_return(@tournament)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the tournament requested" do
      Tournament.should_receive(:find).with("1").and_return(@tournament)
      do_get
    end
  
    it "should render the found tournament as xml" do
      @tournament.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /tournaments/new" do

    before(:each) do
      @tournament = mock_model(Tournament)
      Tournament.stub!(:new).and_return(@tournament)
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
  
    it "should create an new tournament" do
      Tournament.should_receive(:new).and_return(@tournament)
      do_get
    end
  
    it "should not save the new tournament" do
      @tournament.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new tournament for the view" do
      do_get
      assigns[:tournament].should equal(@tournament)
    end
  end

  describe "handling GET /tournaments/1/edit" do

    before(:each) do
      @tournament = mock_model(Tournament)
      Tournament.stub!(:find).and_return(@tournament)
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
  
    it "should find the tournament requested" do
      Tournament.should_receive(:find).and_return(@tournament)
      do_get
    end
  
    it "should assign the found Tournament for the view" do
      do_get
      assigns[:tournament].should equal(@tournament)
    end
  end

  describe "handling POST /tournaments" do

    before(:each) do
      @tournament = mock_model(Tournament, :to_param => "1")
      Tournament.stub!(:new).and_return(@tournament)
    end
    
    describe "with successful save" do
  
      def do_post
        @tournament.should_receive(:save).and_return(true)
        post :create, :tournament => {}
      end
  
      it "should create a new tournament" do
        Tournament.should_receive(:new).with({}).and_return(@tournament)
        do_post
      end

      it "should redirect to the new tournament" do
        do_post
        response.should redirect_to(tournament_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @tournament.should_receive(:save).and_return(false)
        post :create, :tournament => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /tournaments/1" do

    before(:each) do
      @tournament = mock_model(Tournament, :to_param => "1")
      Tournament.stub!(:find).and_return(@tournament)
    end
    
    describe "with successful update" do

      def do_put
        @tournament.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the tournament requested" do
        Tournament.should_receive(:find).with("1").and_return(@tournament)
        do_put
      end

      it "should update the found tournament" do
        do_put
        assigns(:tournament).should equal(@tournament)
      end

      it "should assign the found tournament for the view" do
        do_put
        assigns(:tournament).should equal(@tournament)
      end

      it "should redirect to the tournament" do
        do_put
        response.should redirect_to(tournament_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @tournament.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /tournaments/1" do

    before(:each) do
      @tournament = mock_model(Tournament, :destroy => true)
      Tournament.stub!(:find).and_return(@tournament)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the tournament requested" do
      Tournament.should_receive(:find).with("1").and_return(@tournament)
      do_delete
    end
  
    it "should call destroy on the found tournament" do
      @tournament.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the tournaments list" do
      do_delete
      response.should redirect_to(tournaments_url)
    end
  end
end