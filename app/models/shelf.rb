class Shelf < ActiveRecord::Base
  belongs_to :drink

  validates_presence_of :name

  accepts_nested_attributes_for :drink
end
