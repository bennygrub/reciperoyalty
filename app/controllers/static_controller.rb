class StaticController < ApplicationController
  before_filter :check_for_admin, :only => [:admin_recipes]
  layout "fullpage", :only => [:home, :about]
  def home
  	@title = "Recipe Royalty | There Can Be Only One BEST Recipe"
  	@featured = Recipe.where("slider = ?", true)
  end

  def about
  	@title = "Recipe Royalty | There Can Be Only One BEST Recipe"
  	@featured = Recipe.where("slider = ?", true)
  end

  def contact
  end

  def admin_recipes
    @recipes_challengers = Recipe.where("king = ?", false)
    @best_recipes = Recipe.where("king = ?", true)
  end

  def search
    @recipes_best = Recipe.where("king = ?", true)
    @search = @recipes_best.search(params[:search])
    @articles = @search.all  # load all matching records
    # @articles = @search.relation # Retrieve the relation, to lazy-load in view
    # @articles = @search.paginate(:page => params[:page]) # Who doesn't love will_paginate?
  end

  private

  def check_for_admin
    unless current_user.try(:admin?)
      redirect_to root_path, :alert => "You Are Not An Admin Buddy"
    end 
  end
end
