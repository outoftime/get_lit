class Drink < ActiveRecord::Base

  TYPES = %w(beer highball wine teapot cocktail shots testtube lowball)

  self.include_root_in_json = false

  has_many :shelves

  validates_presence_of :name

  def self.options_for_drink_type_select
    TYPES.map do |type|
      [
        I18n.t("activerecord.labels.drink.drink_type.#{type}"),
        type
      ]
    end
  end
end
