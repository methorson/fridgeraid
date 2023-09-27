require "open-uri"
class RecipesController < ApplicationController

  def index
    @recipes = []
    @api = RecipeApi.new(ENV["APP_SPOON_KEY"])
    if params[:fridge_list_ingredient].present?
      # current_user.recipes.destroy_all//Kathy
      # @recipes = Recipe.search_by_ingredients(search_params[:selected_ingredient])/marina
      ingredients = params[:fridge_list_ingredient][:selected_ingredient].join(",")
      @api_recipes = @api.recipe_by_ingredient(ingredients)
      recipes_id = @api_recipes["results"].map { |hash| hash["id"] }
      recipes_id.each do |api_id|
#skip recipes if they already exist in the DB with the same id from the api
        @recipe = Recipe.find_by(api_id: api_id)
#
#add a recipe to @recipes if
        if @recipe.present?
          @recipes << @recipe
          next
        end

        @api_recipe = @api.recipe_information(api_id)
        if @api_recipe["image"].present?
          recipe = Recipe.new(
            "api_id"=>api_id,
            "name"=> @api_recipe["title"],
            "preparation_time"=> @api_recipe["readyInMinutes"],
            "number_of_portions"=> @api_recipe["servings"],
            "instruction"=> @api_recipe["instructions"],
            "description"=> @api_recipe["summary"]
          )
          file = URI.open(@api_recipe["image"])
          recipe.photo.attach(io: file, filename: "recipe.png", content_type: "image/png")
          recipe.user = current_user
          recipe.save!
          @recipes << recipe
        end
      end
    end
  end

  def create_recipe_from_api

  end

  def like_rails
    recipe = Recipe.find(params[:recipe_id])
    current_user.favorite(recipe)
    head :ok
  end

  def unlike_rails
    recipe = Recipe.find(params[:recipe_id])
    current_user.unfavorite(recipe)
    head :ok
  end

  def all_favorite_recipes
    @all_favorites = current_user.all_favorites
    @favorite_recipes = []
    @all_favorites.each do |favorite|
      @favorite_recipes << favorite.favoritable_id
    end
    @favorite_recipes = Recipe.where(id: @favorite_recipes)
    if params[:query].present?
      @favorite_recipes = @favorite_recipes.search_by_recipe_name(params[:query])
    else
      @all_favorites = current_user.all_favorites
    end
  end

  def mark
    recipe = Recipe.find(params[:recipe_id])
    recipe.done = true
    recipe.save
    # redirect_to recipes_path
    head :ok
  end

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

  private
  def search_params
    params.require(:fridge_list_ingredient).permit(selected_ingredient: [])
  end
end
