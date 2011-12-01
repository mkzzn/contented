class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :attachable_id
      t.string :attachable_type
      t.string :asset

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
