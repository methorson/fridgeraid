class AddCategoryToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :category, index: true, foreign_key: true
  end
end
