class Player < ActiveRecord::Base
  has_many :entries
  has_many :tournaments, :through => :entries
  has_many :league_tournaments, :through => :entries, :source => :tournament, :include => :league
  
  validates_uniqueness_of :first, :scope => :last
  validates_presence_of :last
  
  def leagues
    league_tournaments.collect{|tournament| tournament.league}.uniq
  end
  
  def full_name
    return [first, last].join(' ') unless first.blank?
    last
  end
  
  def full_name=(string)
    split = string.split(' ')
    self.last, self.first = split.pop, split.join(' ')
  end
  
  def image_url_link
    "<IMG SRC=\"#{image_url}\" />"
  end
end