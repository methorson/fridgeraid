class AddUserToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :user, null: false, foreign_key: true

    change_column :recipes, :user_id, :integer, null: true
  end
end
