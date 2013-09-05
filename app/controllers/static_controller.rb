class StaticController < ApplicationController
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
end
