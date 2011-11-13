class CreateDrinks < ActiveRecord::Migration
  def self.up
    create_table :drinks, :force => true do |t|
      t.string :name, :null => false
      t.text :recipe_html, :null => false
      t.text :explanation
      t.timestamps :null => false
    end
  end

  def self.down
    drop_table :drinks
  end
end
