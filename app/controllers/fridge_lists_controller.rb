class FridgeListsController < ApplicationController
  def show
    @fridge_list = FridgeList.find_by(user_id: current_user)
    # @fridge_list = current_user.fridge_list
    puts "Current User: #{current_user.inspect}"
    @categories = Category.all
    @fridge_list_ingredient = @fridge_list.fridge_list_ingredients.find_by(params[:fridge_list_ingredients])
    @fridge_list_ingredients = FridgeListIngredient.new
  end
end
