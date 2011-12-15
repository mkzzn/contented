class AddMoreSlugs < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.string :slug
      t.index :slug, :unique => true
    end

    change_table :users do |t|
      t.string :slug
      t.index :slug, :unique => true
    end
  end

  def self.down
    remove_column :categories, :slug
    remove_column :users, :slug
  end
end
