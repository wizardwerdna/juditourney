class StandingSweeper < ActionController::Caching::Sweeper
  observe Entry, League
  def expire_cached_content(record)
    league_record = case record
      when Entry then record.tournament.league
      when League then record
    end
    expire_page standing_path(league_record)
  end

  alias_method :after_save, :expire_cached_content
  alias_method :after_destroy, :expire_cached_content
end