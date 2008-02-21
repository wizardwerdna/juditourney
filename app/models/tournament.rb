class Tournament < ActiveRecord::Base
  belongs_to :league
  has_many :entries
  validates_uniqueness_of :start, :scope => :league_id, 
    :message => "must be different for each tournament in a league"
  validates_presence_of :buyin
  validates_presence_of :league
  validates_presence_of :start
end
