class Shelf < ActiveRecord::Base
  belongs_to :drink

  validates_presence_of :name
end
