class FridgeList < ApplicationRecord

  has_many :ingredients, through: :fridge_list_ingredients, dependent: :destroy

end
