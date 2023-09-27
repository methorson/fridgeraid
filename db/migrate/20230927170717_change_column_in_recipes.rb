class ChangeColumnInRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :api_id, :integer, index: true
  end
end
