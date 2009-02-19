class AddDescriptionToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :description, :text 
  end

  def self.down
    remove_column :players, :description
  end
end
