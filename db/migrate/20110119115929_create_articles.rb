class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.references :category
      t.integer :pageviews

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
