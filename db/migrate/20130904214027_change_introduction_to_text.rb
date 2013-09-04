class ChangeIntroductionToText < ActiveRecord::Migration
  def change
  	change_column :recipes, :introduction, :text
  end
end
