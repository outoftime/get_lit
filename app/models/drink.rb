class Drink < ActiveRecord::Base
  self.include_root_in_json = false

  has_many :shelves

  validates_presence_of :name
end
