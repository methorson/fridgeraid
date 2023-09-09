class CreateFridgeListIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :fridge_list_ingredients do |t|
      t.references :fridge_list, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
