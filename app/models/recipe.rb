class Recipe < ApplicationRecord

  validates :name, :description, :instruction, :preparation_time, presence: true
  has_many :ingredients, through: :recipe_ingredients
  has_one_attached :photo
end
