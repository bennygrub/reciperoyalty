class UsersController < ApplicationController
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
end
