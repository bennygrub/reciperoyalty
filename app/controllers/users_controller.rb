class UsersController < ApplicationController
  before_filter :check_for_admin, :only => [:index]
  before_filter :yourself, :only => [:edit, :show]
  before_filter :authenticate_user!
  before_filter :auth_user

  def show
  	@user = User.find(params[:id])
  	@current_kings = @user.recipes.where("king = ?", true)
  	@current_challenges = @user.recipes.where("king = ? AND created_at > ?", false, 30.days.ago)
  	@past_recipes = @user.recipes.where("king = ? AND created_at < ?", false, 30.days.ago)
    @loves = Love.where("user_id = ?", @user.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def admin_edit
    @user = User.find(params[:id])
  end
  
  private
  
  def check_for_admin
    unless current_user.try(:admin?)
      redirect_to root_path, :alert => "You Are Not An Admin Buddy"
    end 
  end
  def yourself
    if current_user
      @user = User.find(params[:id])
      unless current_user.id == @user.id
        redirect_to root_path, :alert => "You Aren't You"
      end
    end 
  end

  def auth_user
    redirect_to new_user_registration_url unless user_signed_in?
  end
end
