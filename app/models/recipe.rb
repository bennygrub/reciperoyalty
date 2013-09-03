class Recipe < ActiveRecord::Base
  attr_accessible :cook, :difficulty, :directions, :ingredients, :introduction, :name, :prep, :serving, :dish_id, :recipe_images_attributes
  belongs_to :user
  belongs_to :dish
  has_many :recipe_images, :dependent => :destroy
  accepts_nested_attributes_for :recipe_images, reject_if: :all_blank#, :reject_if => lambda { |t| t[:recipe_image].blank? }
  validates :cook, :difficulty, :directions, :ingredients, :introduction, :name, :prep, :serving, :dish_id, :presence => true
end
