class FridgeListIngredient < ApplicationRecord

  belongs_to :fridge_list
  belongs_to :Ingredient
  
end
