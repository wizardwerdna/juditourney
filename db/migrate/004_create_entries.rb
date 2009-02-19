class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :tournament_id
      t.integer :player_id
      t.integer :paid
      t.integer :result
      t.integer :payout

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
