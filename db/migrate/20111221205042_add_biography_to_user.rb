class AddBiographyToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :biography, :text
  end

  def self.down
    remove_column :users, :biography
  end
end
