class CreateTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments do |t|
      t.string :league_id
      t.datetime :start
      t.text :description
      t.integer :buyin

      t.timestamps
    end
  end

  def self.down
    drop_table :tournaments
  end
end
