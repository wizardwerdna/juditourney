class TournamentEntriesController < EntriesController
  
    def crumbs
      [home_crumb, leagues_crumb, tournaments_crumb, entries_crumb]
    end
  
    protected

    def redirect_to_resource
      redirect_to(tournament_entry_url(@tournament, @entry))
    end

    def redirect_to_resources
      redirect_to(tournament_entries_url(@tournament))
    end

    def load_resource_finder
      @parent = @tournament = Tournament.find(params[:tournament_id])
      @resource_finder = @parent.entries
    end
    
    def initialize_new_resource
      @entry.tournament = @tournament
      @entry.paid = @tournament.buyin
    end

  end
