class Recipe < ApplicationRecord
  belongs_to :user


  include PgSearch::Model
  pg_search_scope :search_by_title_and_ingredients,
    against: [ :title, :ingredients ],
    using: {
      tsearch: { prefix: true }
    }
end
