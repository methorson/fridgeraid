class FridgeListIngredientsController < ApplicationController
  before_action :set_fridge_list, only: [:edit, :update]
  def new
    @fridge_list_ingredient = FridgeListIngredient.new
  end

  def create
    # @fridge_list_ingredient = FridgeListIngredient.new(fridge_list_ingredients_params)
    ingredients = params[:fridge_list_ingredient][:selected_ingredient]
    # 1- Find the fridge list and save in a variable
    @fridge_list = FridgeList.find(params[:fridge_list_id])
    # 2 - .each inside the array and find each ingredient by id
    ingredients.each do |ingredient|
      ingredient_id = ingredient.to_i
      #raise
      #@fridge_list.ingredients << Ingredient.find(ingredient)
       FridgeListIngredient.create(ingredient_id: ingredient_id, fridge_list: @fridge_list )
    end
    # 3- For each you wnt associate with your fridge_list

    # 4- After add all the ingredients in the fridge_list you want to save it

    if @fridge_list.save
      redirect_to fridge_list_path(@fridge_list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @fridge_list.update(fridge_list_ingredients_params)
      redirect_to fridge_list_path(@fridge_list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @fridge_list_ingredient = FridgeListIngredient.find(params[:id])
    @fridge_list_ingredient.destroy
    redirect_to fridge_list_path, status: :see_other
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
