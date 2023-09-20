class ChangeDoneDefaulInRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :done, :boolean, null: false, default: false
  end
end
