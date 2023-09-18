class Recipe < ApplicationRecord
  validates :name, :description, :instruction, :preparation_time, presence: true
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
  acts_as_favoritable
end
