class RecipesController < ApplicationController
  def index
    if params[:fridge_list_ingredient].present?
      @recipes = Recipe.search_by_ingredients(search_params[:selected_ingredient])
    # @recipe_ingredients = RecipeIngredient.where(ingredient_id: search_params["selected_ingredient"].first.to_i)
    # @recipes = []
    # @recipe_ingredients.each do |recipe_ingredient|
    #   @recipes << Recipe.find(recipe_ingredient.recipe_id)
    # end
    else
      @recipes = Recipe.all
    end
   #@recipes =  current_user.favorited_by_type('Recipe')
  end

  def like
    recipe = Recipe.find(params[:recipe_id])
    current_user.favorite(recipe)
    head :ok
  end

  def unlike
    recipe = Recipe.find(params[:recipe_id])
    current_user.unfavorite(recipe)
    head :ok
  end

  def all_favorite_recipes
    @all_favorites = current_user.all_favorites
    @favorite_recipes = []
    @all_favorites.each do |favorite|
      @favorite_recipes << Recipe.find(favorite.favoritable_id)
    end
  end

  def mark
    recipe = Recipe.find(params[:recipe_id])
    recipe.done = true
    recipe.save
    # redirect_to recipes_path
    head :ok
  end


  private

  def mark_undone
    recipe = Recipe.find(params[:recipe_id])
    recipe.done = false
    recipe.save
    # redirect_to recipes_path
    head :ok
  end

  def all_done_recipes
    # @done_recipes = Recipe.select { |recipe| recipe[:done] == true }
    # @done_recipes = Recipe.where(done: true) this would be for all the saved ones
    @done_recipes = Recipe.where(done: true)
  end

  def search_params
    params.require(:fridge_list_ingredient).permit(selected_ingredient: [])
  end
end
