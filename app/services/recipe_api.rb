require 'httparty'

class RecipeApi
  include HTTParty

  base_uri 'https://api.spoonacular.com/recipes'

  def initialize(api_key)
    @options = { query: {apiKey: api_key} }
  end

  def all_recipes
    self.class.get("/complexSearch", @options)
  end

  def recipe_by_ingredient(ingredient)
    options = {query: @options[:query].merge({query: ingredient})}

    self.class.get("/complexSearch", options)
  end

  def recipe_information(id)
    self.class.get("/#{id}/information", @options)
  end

end
