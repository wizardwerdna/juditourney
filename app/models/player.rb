class Player < ActiveRecord::Base
  validates_uniqueness_of :first, :scope => :last
  validates_presence_of :last
  
  def full_name
    first + " " + last    
  end
  
  def sort_name(add="")
    add + last + "                    " + first
  end

  def sorted_by_name_and_membership(league)
    players = self.find(:all).sort()
  end

end
