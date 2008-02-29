class TournamentEntriesController < EntriesController

    def crumbs
      [home_crumb, leagues_crumb, league_crumb(@tournament.league), 
        league_tournament_crumb(@tournament.league, @tournament),
          tournament_entry_crumb(@tournament, @entry)]
    end
    
    def page_title
      "Tournament Entries for #{@tournament.league.name}"
    end

    def add_single_crumb
#      @crumbs << tournament_entry_crumb(@tournament, @entry)
    end
    
    def ac_for_player_full_name
      1/0
    end
  
    protected

    def redirect_to_resource
      redirect_to(tournament_entry_url(@tournament, @entry))
    end

    def redirect_to_resources
      redirect_to(tournament_entries_url(@tournament))
    end

    def redirect_to_new_resource
      redirect_to(new_tournament_entry_url(@tournament))
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
