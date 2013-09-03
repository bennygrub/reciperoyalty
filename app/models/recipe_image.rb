class RecipeImage < ActiveRecord::Base
  attr_accessible :caption, :recipe_id, :photo
  belongs_to :recipe
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_presence : photo
end
