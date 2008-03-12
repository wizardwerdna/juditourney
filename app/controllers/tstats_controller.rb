class TstatsController < ApplicationController
  # GET /tstats
  # GET /tstats.xml
  def index
    @tstats = Tstat.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tstats }
    end
  end

  # GET /tstats/1
  # GET /tstats/1.xml
  def show
    @tstat = Tstat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tstat }
    end
  end

  # GET /tstats/new
  # GET /tstats/new.xml
  def new
    @tstat = Tstat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tstat }
    end
  end

  # GET /tstats/1/edit
  def edit
    @tstat = Tstat.find(params[:id])
    @report = @tstat.report
  end

  # POST /tstats
  # POST /tstats.xml
  def create
    @tstat = Tstat.new(params[:tstat])

    respond_to do |format|
      if @tstat.save
        flash[:notice] = 'Tstat was successfully created.'
        format.html { redirect_to(@tstat) }
        format.xml  { render :xml => @tstat, :status => :created, :location => @tstat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tstat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tstats/1
  # PUT /tstats/1.xml
  def update
    @tstat = Tstat.find(params[:id])

    respond_to do |format|
      if @tstat.update_attributes(params[:tstat])
        flash[:notice] = 'Tstat was successfully updated.'
        format.html { redirect_to(edit_tstat_url(@tstat)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tstat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tstats/1
  # DELETE /tstats/1.xml
  def destroy
    @tstat = Tstat.find(params[:id])
    @tstat.destroy

    respond_to do |format|
      format.html { redirect_to(tstats_url) }
      format.xml  { head :ok }
    end
  end
end
