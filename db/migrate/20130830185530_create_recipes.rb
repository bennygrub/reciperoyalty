class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :name
      t.string :introduction
      t.integer :serving
      t.time :prep
      t.time :cook
      t.string :difficulty
      t.text :ingredients
      t.text :directions

      t.timestamps
    end
  end
end
