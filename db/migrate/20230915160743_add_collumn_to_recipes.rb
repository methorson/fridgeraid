class AddCollumnToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :category, :string
  end
end
