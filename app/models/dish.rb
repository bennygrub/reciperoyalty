class Dish < ActiveRecord::Base
  attr_accessible :name, :cuisine_list, :category_list
  has_many :recipes
  acts_as_taggable_on :category, :cuisine
end
