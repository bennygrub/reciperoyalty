class Recipe < ActiveRecord::Base
  attr_accessible :cook, :difficulty, :directions, :ingredients, :introduction, :name, :prep, :serving
  belongs_to :user
end
