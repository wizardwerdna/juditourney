class TournamentsController < ApplicationController
  prepend_before_filter :load_resource_finder, :set_page_title
  
  # GET /tournaments
  # GET /tournaments.xml
  def index
    @tournaments = @resource_finder.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tournaments }
    end
  end

  # GET /tournaments/1
  # GET /tournaments/1.xml
  def show
    @tournament = @resource_finder.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tournament }
    end
  end

  # GET /tournaments/new
  # GET /tournaments/new.xml
  def new
    @tournament = @resource_finder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tournament }
    end
  end

  # GET /tournaments/1/edit
  def edit
    @tournament = @resource_finder.find(params[:id])
  end

  # POST /tournaments
  # POST /tournaments.xml
  def create
    @tournament = @resource_finder.new(params[:tournament])
    respond_to do |format|
      logger.warn @tournament.to_yaml
      if @tournament.save
        flash[:notice] = 'Tournament was successfully created.'
        format.html { redirect_to_resource }
        format.xml  { render :xml => @tournament, :status => :created, :location => @tournament }
        format.js   { 
          render :update do |page|
            page.insert_html :after, 'new_tournament', :partial => 'league_tournament_item', :object => @tournament, :locals => {:league => @league}
            page.select("#tournament_#{@tournament.id}").each do |item|
                item.visual_effect :highlight, :endcolor=>"FFFFFF", :duration => 1.0
            end
            @tournament = @resource_finder.new
            page.replace_html 'new_tournament', :partial => 'league_tournament_new_item', :object => @tournament, :locals => {:league => @league}            
          end
        }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tournament.errors, :status => :unprocessable_entity }
        format.js   {
          render :update do |page|
            page['new_tournament'].replace_html :partial => 'league_tournament_new_item', :object => @tournament, :locals => {:league => @league}
            page['new_tournament_form_errors'].visual_effect :shake, 'new_tournament_form_errors', :duration => 0.5
          end
        }
      end
    end
  end

  # PUT /tournaments/1
  # PUT /tournaments/1.xml
  def update
    @tournament = @resource_finder.find(params[:id])

    respond_to do |format|
      if @tournament.update_attributes(params[:tournament])
        flash[:notice] = 'Tournament was successfully updated.'
        format.html { redirect_to_resource }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tournament.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.xml
  def destroy
    @tournament = @resource_finder.find(params[:id])
    @tournament.destroy

    respond_to do |format|
      format.html { redirect_to_resources }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def redirect_to_resource
    redirect_to(@tournament)
  end
  
  def redirect_to_resources
    redirect_to(tournaments_url)
  end
  
  def load_resource_finder
    @resource_finder = Tournament
  end
  
end
