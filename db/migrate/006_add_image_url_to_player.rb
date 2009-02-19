class AddImageUrlToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :image_url, :string
  end

  def self.down
    remove_column :players, :image_url
  end
end
