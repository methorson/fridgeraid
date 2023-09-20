class FridgeListIngredientsController < ApplicationController
  def new
    @fridge_list_ingredient = FridgeListIngredient.new
  end

  def create
    @fridge_list_ingredient = FridgeListIngredient.new(fridge_list_ingredients_params)

    if @fridge_list_ingredient.save
      redirect_to recipes_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def set_fridge_list
    @fridge_list = FridgeList.find(params[:fridge_list_id])
  end

  def fridge_list_ingredients_params
    params.require(:fridge_list_ingredient).permit(
      :fridge_list_id,
      :category_id,
      ingredient_id: []
    )
  end
end
