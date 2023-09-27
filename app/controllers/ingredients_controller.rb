class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :update, :destroy]
  before_action :set_fridge_list, only:[:new, :create]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = ingredient.new(ingredient_params)
    @ingredient.user = current_user
    @ingredient.fridge_list = @fridge_list


    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  #   if @ingredient.update(ingredient_params)
  #     redirect_to ingredient_path(@ingredient)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def destroy
    @fridge_list_ingredient = FridgeListIngredient.find(params[:id])
    @fridge_list = @fridge_list_ingredient.fridge_list
    @fridge_list_ingredient.update(ingredient: nil)
    @ingredient = @fridge_list_ingredient.ingredient
    @ingredient.destroy
    redirect_to fridge_list_path(@fridge_list), status: :see_other
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_fridge_list
    @fridge_list = fridge_list.find(params[:fridge_list_id])
  end
end
