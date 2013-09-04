class Love < ActiveRecord::Base
  attr_accessible :recipe_id, :user_id
  belongs_to :user
  belongs_to :recipe
end
