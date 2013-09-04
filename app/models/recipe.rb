class Recipe < ActiveRecord::Base
  attr_accessible :cook, :difficulty, :directions, :ingredients, :introduction, :name, :prep, :serving, :dish_id, :recipe_images_attributes
  belongs_to :user
  belongs_to :dish
  has_many :recipe_images, :dependent => :destroy
  has_many :loves
  accepts_nested_attributes_for :recipe_images, reject_if: :all_blank, :allow_destroy => true#, :reject_if => lambda { |t| t[:recipe_image].blank? }
  validates :cook, :difficulty, :directions, :ingredients, :introduction, :name, :prep, :serving, :dish_id, :presence => true
  validate :require_photo

  private
  	def require_photo
  		errors.add(:base, 'Must have at least one child') if recipe_images.all?(&:marked_for_destruction?)
  	end
end
