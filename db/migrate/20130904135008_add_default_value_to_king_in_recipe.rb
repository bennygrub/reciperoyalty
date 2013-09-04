class AddDefaultValueToKingInRecipe < ActiveRecord::Migration
  def change
  	change_column :recipes, :king, :boolean, :default => false
  end
end
