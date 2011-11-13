class CreateShelves < ActiveRecord::Migration
  def self.up
    create_table :shelves, :force => true do |t|
      t.integer :drink_id
      t.string :name, :null => false, :limit => 50
      t.timestamps :null => false
    end
    add_index :shelves, :name, :unique => true
  end
  
  def self.down
    drop_table :shelves
  end
end
