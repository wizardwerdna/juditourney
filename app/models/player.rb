class Player < ActiveRecord::Base
  has_many :entries
  has_many :tournaments, :through => :entries
  has_many :league_tournaments, :through => :entries, :source => :tournament, :include => :league
  
  validates_uniqueness_of :first, :scope => :last
  validates_presence_of :last
  
  def self.split_names_from(string)
    return [nil, nil] if string.nil? || string.empty?
    split = string.split(' ')
    return split.pop.strip, split.join(' ').strip
  end
  
  def self.find_by_full_name(string, *args)
    last, first = split_names_from(string)
    find_by_first_and_last(first, last, *args)
  end
  
  def self.find_all_by_full_name(string, *args)
    last, first = split_names_from(string)
    find_all_by_first_and_last(first, last, *args)
  end
  
  def self.find_all_by_full_name_like(string, *args)
    last, first = split_names_from(string)
    puts "test"
    find(:all, *args).select do |player|
      puts "trying #{player.full_name}"
      player.full_name.downcase.include? string.downcase
    end
  end
  
  def self.find_or_create_by_full_name(string)
    last, first = split_names_from(string)
    find_or_create_by_first_and_last(first, last)
  end
  
  def leagues
    league_tournaments.collect{|tournament| tournament.league}.uniq
  end
  
  def full_name
    return [first, last].join(' ') unless first.blank?
    last
  end
  
  def full_name=(string)
    self.last, self.first = Player.split_names_from(string)
  end
  
  def image_url_link
    "<IMG SRC=\"#{image_url}\" />"
  end
end