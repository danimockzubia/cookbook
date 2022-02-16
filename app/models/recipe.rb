class Recipe < ApplicationRecord
  belongs_to :user

  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_ingredients,
    against: [ :title, :ingredients ],
    using: {
      tsearch: { prefix: true }
    }
end
