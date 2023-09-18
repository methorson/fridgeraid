class FridgeListIngredientsController < ApplicationController
  def new
    @fridge_list_ingredient = FridgeListIngredient.new
  end

  def create
    @fridge_list_ingredient = FridgeListIngredient.new(fridge_list_ingredients_params)

    if @fridge_list_ingredient.save
      redirect_to @fridge_list_ingredient
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def set_fridge_list
    @fridge_list = FridgeList.find(params[:fridge_list_id])
  end

  def fridge_list_ingredients_params
    permit(:fridge_list_ingredient).require(:fridge_list_id, :quantity, :category_id)
  end

end
