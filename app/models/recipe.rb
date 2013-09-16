class Recipe < ActiveRecord::Base
  attr_accessible :cook, :difficulty, :directions, :ingredients, :introduction, :name, :prep, :serving, :dish_id, :recipe_images_attributes, :video
  belongs_to :user
  belongs_to :dish
  has_many :recipe_images, :dependent => :destroy
  has_many :loves
  accepts_nested_attributes_for :recipe_images, reject_if: :all_blank, :allow_destroy => true#, :reject_if => lambda { |t| t[:recipe_image].blank? }
  validates :cook, :difficulty, :directions, :ingredients, :introduction, :name, :prep, :serving, :dish_id, :presence => true
  validate :require_photo
  validates_length_of :name, :maximum => 28
  acts_as_commentable
  has_many :comments, :as => :commentable, :dependent => :destroy

  after_create :create_recipe_email

  private
  	def require_photo
  		errors.add(:base, 'Must have at least one photo') if recipe_images.all?(&:marked_for_destruction?)
  	end

    def create_recipe_email
      
    end

end
