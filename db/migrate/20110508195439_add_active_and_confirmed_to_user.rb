class AddActiveAndConfirmedToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.boolean :active, :default => true, :null => false
      t.boolean :confirmed, :default => false, :null => false
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :active, :confirmed
    end
  end
end
