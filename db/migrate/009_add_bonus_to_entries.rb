class AddBonusToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :bonus_points, :integer
  end

  def self.down
    remove_column :entries, :bonus
  end
end
