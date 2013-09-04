class AddSliderToRecipes < ActiveRecord::Migration
def up
    add_column :recipes, :slider, :boolean, :default => false
end

def down
    remove_column :recipes, :slider, :boolean, :default => false
end
end
