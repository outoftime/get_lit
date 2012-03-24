class AddDrinkTypeToDrinks < ActiveRecord::Migration
  def change
    change_table :drinks do |t|
      t.string :drink_type, :null => false, :default => 'testtube'
    end
  end
end
