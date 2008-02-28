class EntriesController < ApplicationController
  
  before_filter :load_resource_finder
  
  def crumbs
    [home_crumb, entries_crumb]
  end
  
  # GET /entries
  # GET /entries.xml
  def index
    @entries = @resource_finder.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    @entry = @resource_finder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.xml
  def new
    @entry = @resource_finder.new
    initialize_new_resource
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = @resource_finder.find(params[:id])
  end

  # POST /entries
  # POST /entries.xml
  def create
    @entry = @resource_finder.new(params[:entry])

    respond_to do |format|
      if @entry.save
        flash[:notice] = 'Entry was successfully created.'
        format.html { redirect_to_resource }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = @resource_finder.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        flash[:notice] = 'Entry was successfully updated.'
        format.html { redirect_to_resource }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = @resource_finder.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to_resources }
      format.xml  { head :ok }
    end
  end

  private

  def redirect_to_resource
    redirect_to(@entry)
  end

  def redirect_to_resources
    redirect_to(entries_url)
  end

  def load_resource_finder
    @resource_finder = Entry
  end
  
  def initialize_new_resource
  end
end
