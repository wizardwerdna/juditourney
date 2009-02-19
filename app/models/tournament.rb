class Tournament < ActiveRecord::Base
  belongs_to :league
  has_many :entries
  validates_uniqueness_of :start, :scope => :league_id, 
    :message => "must be different for each tournament in a league"
  validates_presence_of :buyin
  validates_presence_of :league
  validates_presence_of :start
  
  def financials
      self.entries.inject([0,0]) do |sum, e|
        [sum[0]+(e.paid || 0), sum[1]+(e.payout || 0)]
      end
  end
  
  def formatted_start(type = ":long")
    format = "%a %b %d %I:%M %p"
    case type
    when :long
      format = "%a %b %d %I:%M %p"
    when :short
      format = "%b %d"
    end
    start.strftime(format)
  end
end
