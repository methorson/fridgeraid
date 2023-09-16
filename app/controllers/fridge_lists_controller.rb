class FridgeListsController < ApplicationController
  def show
    @fridge_list = FridgeList.last
    @categories = Category.all
    @ingredients = Ingredient.all
    @fridge_list_ingredients = FridgeListIngredient.new
  end
end
