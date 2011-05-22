class AddNamesToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :display_name
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :first_name
      t.remove :last_name
      t.remove :display_name
    end
  end
end
