class FridgeList < ApplicationRecord
  has_many :fridge_list_ingredients
  has_many :ingredients, through: :fridge_list_ingredients, dependent: :destroy
  belongs_to :user
end
