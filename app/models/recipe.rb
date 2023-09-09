class Recipe < ApplicationRecord

  validates :name, :description, :instructions, :preparation_time, presence: true
  has_many :ingredients, through: :recipe_ingredients
end
