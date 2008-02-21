class League < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  has_many :tournaments
  
  def entries
    Entry.find_by_sql [
        "SELECT e.* from entries e, tournaments t WHERE e.tournament_id = t.id AND t.league_id = ?",
        id]
  end
  
  def standings
      s = {}
      self.entries.each do |e|
        s[e.player.full_name] = (s[e.player.full_name] || 0) + e.points
      end
      s.to_a.sort{|a,b| b[1] <=> a[1]}
  end
  
  def financials
      self.entries.inject([0,0]) do |sum, e|
        [sum[0]+e.paid, sum[1]+e.payout]
      end
  end
  
  def registered_players
    Player.find_by_sql ["SELECT DISTINCT p.* FROM players p, entries e, tournaments t WHERE e.player_id = p.id AND e.tournament_id = t.id AND t.league_id = ? ORDER BY p.last, p.first", id]
  end
  
  def unregistered_players
    Player.find(:all, :order => "last, first") - registered_players
  end
  
  def player_select_list
    registered_players.collect{|each| [each.full_name, each.id]} +
    unregistered_players.collect{|each| [each.full_name, each.id]}
  end

end