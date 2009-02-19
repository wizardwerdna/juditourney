class CreateTstats < ActiveRecord::Migration
  def self.up
    create_table :tstats do |t|
      t.integer :hero_chips
      t.integer :small_blind
      t.integer :big_blind
      t.integer :ante
      t.integer :current_table_size
      t.integer :number_of_players_left
      t.integer :number_of_players_at_start
      t.integer :added_chips
      t.integer :starting_chips
      t.integer :maximum_table_size

      t.timestamps
    end
  end

  def self.down
    drop_table :tstats
  end
end
