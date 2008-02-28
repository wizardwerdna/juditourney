class LeagueTournamentsController < TournamentsController
  
  def crumbs
    [home_crumb, leagues_crumb, league_tournaments_crumb]
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
