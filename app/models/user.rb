class User < ActiveRecord::Base
  
  #mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :about, :website, :avatar
  #attr_accesor :avatar_file_name
  # attr_accessible :title, :body

  has_many :recipes
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "50x50>" }, :default_url => "missing_:style.png"

  has_many :loves



end
