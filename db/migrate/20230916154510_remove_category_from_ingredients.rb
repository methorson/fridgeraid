class RemoveCategoryFromIngredients < ActiveRecord::Migration[7.0]
  def change
    remove_column :ingredients, :category
  end
end
