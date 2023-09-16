class FridgeListIngredient < ApplicationRecord
  belongs_to :fridge_list
  belongs_to :ingredient
  has_one :user, through: :fridge_list
end
