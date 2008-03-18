class LeagueTournamentsController < TournamentsController
  
  def page_title
    "#{@league.name} Tournaments"
  end
  
  # GET /tournaments/1
  # GET /tournaments/1.xml
  def show
    @tournament = @resource_finder.find(params[:id])
    @entry = Entry.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tournament }
    end
  end
  
 
  protected
  
  def redirect_to_resource
    redirect_to(league_tournament_url(@league, @tournament))
  end
  
  def redirect_to_resources
    redirect_to(league_tournaments_url(@league))
  end
  
  def load_resource_finder
    @parent = @league = League.find(params[:league_id])
    @resource_finder = @parent.tournaments
  end
  
end
