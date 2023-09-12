class IngredientsController < ApplicationController
  before_action :set_booking, only: [:edit, :update :destroy]
  before_action :set_office, only:[:new, :create]
  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user = current_user
    @ingredient.fridge_lists = @fridge_lists

    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render new, status: :unprocessable_entity
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to fridge_lists_path, status: :see_other
  end

  private

  def set_ingredient
    @ingredient = ingredient.find(params[:id])
  end

  def set_fridge_list
    @fridge_list = fridge_list.find(params[:fridge_list_id])
  end
end
