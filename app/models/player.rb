class Player < ActiveRecord::Base
  validates_uniqueness_of :first, :scope => :last
  validates_presence_of :last
  
  def full_name
    first + " " + last    
  end   
end