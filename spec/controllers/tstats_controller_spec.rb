require File.dirname(__FILE__) + '/../spec_helper'

describe TstatsController do
  describe "handling GET /tstats" do

    before(:each) do
      @tstat = mock_model(Tstat)
      Tstat.stub!(:find).and_return([@tstat])
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
  
    it "should find all tstats" do
      Tstat.should_receive(:find).with(:all).and_return([@tstat])
      do_get
    end
  
    it "should assign the found tstats for the view" do
      do_get
      assigns[:tstats].should == [@tstat]
    end
  end

  describe "handling GET /tstats.xml" do

    before(:each) do
      @tstat = mock_model(Tstat, :to_xml => "XML")
      Tstat.stub!(:find).and_return(@tstat)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all tstats" do
      Tstat.should_receive(:find).with(:all).and_return([@tstat])
      do_get
    end
  
    it "should render the found tstats as xml" do
      @tstat.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /tstats/1" do

    before(:each) do
      @tstat = mock_model(Tstat)
      Tstat.stub!(:find).and_return(@tstat)
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
  
    it "should find the tstat requested" do
      Tstat.should_receive(:find).with("1").and_return(@tstat)
      do_get
    end
  
    it "should assign the found tstat for the view" do
      do_get
      assigns[:tstat].should equal(@tstat)
    end
  end

  describe "handling GET /tstats/1.xml" do

    before(:each) do
      @tstat = mock_model(Tstat, :to_xml => "XML")
      Tstat.stub!(:find).and_return(@tstat)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the tstat requested" do
      Tstat.should_receive(:find).with("1").and_return(@tstat)
      do_get
    end
  
    it "should render the found tstat as xml" do
      @tstat.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /tstats/new" do

    before(:each) do
      @tstat = mock_model(Tstat)
      Tstat.stub!(:new).and_return(@tstat)
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
  
    it "should create an new tstat" do
      Tstat.should_receive(:new).and_return(@tstat)
      do_get
    end
  
    it "should not save the new tstat" do
      @tstat.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new tstat for the view" do
      do_get
      assigns[:tstat].should equal(@tstat)
    end
  end

  describe "handling GET /tstats/1/edit" do

    before(:each) do
      @tstat = mock_model(Tstat)
      Tstat.stub!(:find).and_return(@tstat)
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
  
    it "should find the tstat requested" do
      Tstat.should_receive(:find).and_return(@tstat)
      do_get
    end
  
    it "should assign the found Tstat for the view" do
      do_get
      assigns[:tstat].should equal(@tstat)
    end
  end

  describe "handling POST /tstats" do

    before(:each) do
      @tstat = mock_model(Tstat, :to_param => "1")
      Tstat.stub!(:new).and_return(@tstat)
    end
    
    describe "with successful save" do
  
      def do_post
        @tstat.should_receive(:save).and_return(true)
        post :create, :tstat => {}
      end
  
      it "should create a new tstat" do
        Tstat.should_receive(:new).with({}).and_return(@tstat)
        do_post
      end

      it "should redirect to the new tstat" do
        do_post
        response.should redirect_to(tstat_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @tstat.should_receive(:save).and_return(false)
        post :create, :tstat => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /tstats/1" do

    before(:each) do
      @tstat = mock_model(Tstat, :to_param => "1")
      Tstat.stub!(:find).and_return(@tstat)
    end
    
    describe "with successful update" do

      def do_put
        @tstat.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the tstat requested" do
        Tstat.should_receive(:find).with("1").and_return(@tstat)
        do_put
      end

      it "should update the found tstat" do
        do_put
        assigns(:tstat).should equal(@tstat)
      end

      it "should assign the found tstat for the view" do
        do_put
        assigns(:tstat).should equal(@tstat)
      end

      it "should redirect to the tstat" do
        do_put
        response.should redirect_to(tstat_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @tstat.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /tstats/1" do

    before(:each) do
      @tstat = mock_model(Tstat, :destroy => true)
      Tstat.stub!(:find).and_return(@tstat)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the tstat requested" do
      Tstat.should_receive(:find).with("1").and_return(@tstat)
      do_delete
    end
  
    it "should call destroy on the found tstat" do
      @tstat.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the tstats list" do
      do_delete
      response.should redirect_to(tstats_url)
    end
  end
end