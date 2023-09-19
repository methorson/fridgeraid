class FridgeListsController < ApplicationController
  def show
    @fridge_list = current_user.fridge_list
     @categories = Category.all
    @fridge_list_ingredients = FridgeListIngredient.new
  end
end
