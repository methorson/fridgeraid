class Ingredient < ApplicationRecord
  validates :name, presence: true
  has_one :category
  # belongs_to :fridge_list
end
