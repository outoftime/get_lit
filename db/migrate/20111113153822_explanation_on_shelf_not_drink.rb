class ExplanationOnShelfNotDrink < ActiveRecord::Migration
  def up
    change_table :drinks do |t|
      t.remove :explanation
    end
    change_table :shelves do |t|
      t.text :explanation
    end
  end

  def down
    change_table :shelves do |t|
      t.remove :explanation
    end
    change_table :drinks do |t|
      t.text :explanation
    end
  end
end
