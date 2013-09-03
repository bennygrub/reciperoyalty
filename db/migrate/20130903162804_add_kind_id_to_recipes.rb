class AddKindIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :dish_id, :integer
    add_column :recipes, :king, :boolean
    add_column :recipes, :king_at, :datetime
    add_column :recipes, :king_out, :datetime
  end
end
