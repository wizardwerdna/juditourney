class Entry < ActiveRecord::Base
  belongs_to :player
  belongs_to :tournament
  
  validates_uniqueness_of :player_id, :scope => :tournament_id, :message => "may only enter a tournament once"
  validates_presence_of :player_id, :message => "must be a valid player id"
  validates_presence_of :tournament_id
  validates_presence_of :paid
  
  def points
    r = result || 0
    if r >= 1 and r <= 8
      10 - r
    else
      1
    end
  end
  
  def place
    if result.blank?
      "???"
    else
      result.ordinalize
    end
  end
        
  def player_full_name
    player && player.full_name
  end
  
  def player_full_name=(string)
    self.player = Player.find_or_create_by_full_name(string)
  end
end
