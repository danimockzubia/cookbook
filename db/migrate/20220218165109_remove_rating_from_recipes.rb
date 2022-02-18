class RemoveRatingFromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :rating, :integer
  end
end
