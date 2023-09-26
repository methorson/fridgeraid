class Recipe < ApplicationRecord
  validates :name, :description, :instruction, :preparation_time, presence: true
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
  acts_as_favoritable

  include PgSearch::Model
  pg_search_scope :search_by_ingredients,
      against: [ :description, :instruction ],
      using: {
        tsearch: {
          prefix: true,
          any_word: true
        } # <-- now `superman batm` will return something!
      }

  pg_search_scope :search_by_recipe_name,
      against: [ :name, :description, :instruction ],
      using: {
        tsearch: {
          prefix: true,
          any_word: true
        }
      }
end
