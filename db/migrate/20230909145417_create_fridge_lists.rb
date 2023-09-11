class CreateFridgeLists < ActiveRecord::Migration[7.0]
  def change
    create_table :fridge_lists do |t|
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
