class Recipe < ApplicationRecord
  validates :name, :description, :instruction, :preparation_time, presence: true
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  acts_as_favoritable

  include PgSearch::Model
  pg_search_scope :search_by_ingredients,
      against: [ :description, :instruction ],
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }
end
