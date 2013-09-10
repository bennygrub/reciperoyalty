class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_update_path_for(resource)
  	#user_path(resource)
  	current_user
  end
end
