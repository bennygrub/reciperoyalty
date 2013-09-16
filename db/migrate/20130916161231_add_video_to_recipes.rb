class AddVideoToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :video, :string
  end
end
