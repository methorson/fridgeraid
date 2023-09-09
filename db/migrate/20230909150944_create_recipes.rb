class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.time :preparation_time
      t.string :name
      t.text :type_of_cuisine
      t.integer :number_of_portions
      t.text :description
      t.text :instruction
      t.integer :level_of_difficulty
      t.integer :done
      t.timestamps
    end
  end
end
