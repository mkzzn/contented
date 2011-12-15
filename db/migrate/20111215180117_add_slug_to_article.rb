class AddSlugToArticle < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.string :slug
      t.index :slug, :unique => true
    end
  end

  def self.down
    remove_column :articles, :slug
  end
end
