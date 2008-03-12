DEFAULT_MAXIMUM_TABLE_SIZE = 10
DEFAULT_ADDED_CHIPS = 0
DEFAULT_ANTE = 0

class Tstat < ActiveRecord::Base
  
  def set_defaults
    self.maximum_table_size ||= DEFAULT_MAXIMUM_TABLE_SIZE
    self.added_chips ||= DEFAULT_ADDED_CHIPS
    self.ante ||= DEFAULT_ANTE
  end
  
  def pot_size
    return nil if small_blind.nil?
    small_blind + (big_blind || 2*small_blind) + (ante || DEFAULT_ANTE) * (current_table_size || maximum_table_size || DEFAULT_MAXIMUM_TABLE_SIZE)
  end
  
  def total_chips
    return nil if starting_chips.nil? or number_of_players_at_start.nil?
    starting_chips * number_of_players_at_start + (added_chips || DEFAULT_ADDED_CHIPS)
  end
  
  def average_chips
    return nil if total_chips.nil? or number_of_players_left.nil? or number_of_players_at_start.nil?
    return nil if number_of_players_left > number_of_players_at_start
    total_chips / number_of_players_left
  end
  
  def average_m
    return nil if average_chips.nil? or pot_size.nil?
    return nil if pot_size.zero?
    (1.0 * average_chips / pot_size).round(1).to_s
  end
  
  def final_table_average_chips
    return nil if total_chips.nil?
    total_chips / (maximum_table_size || DEFAULT_MAXIMUM_TABLE_SIZE)
  end
  
  def hero_q
    return nil if hero_chips.nil? or average_chips.nil?
    return nil if average_chips.zero?
    (1.0 * hero_chips / average_chips).round(2).to_s
  end
  
  def hero_m
    return nil if hero_chips.nil? or pot_size.nil?
    return nil if pot_size.zero?
    (1.0 * hero_chips / pot_size).round(1).to_s
  end
  
  def report
    [
      [:m, hero_m],
      [:q, hero_q],
      [:average_chips, average_chips],
      [:average_m, average_m],
      [:final_table_average_chips, final_table_average_chips]
    ]
  end
end
