class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    current_user
  end

  def after_inactive_sign_up_path_for(resource)
    recipes_path
  end

end
