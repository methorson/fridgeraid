class Ingredient < ApplicationRecord
  validates :name, presence: true
  has_one :category
end
