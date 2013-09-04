class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@current_kings = @user.recipes.where("king = ?", true)
  	@current_challenges = @user.recipes.where("king = ? AND created_at > ?", false, 30.days.ago)
  	@past_recipes = @user.recipes.where("king = ? AND created_at < ?", false, 30.days.ago)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
