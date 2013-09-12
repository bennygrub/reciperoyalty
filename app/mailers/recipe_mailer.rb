class RecipeMailer < ActionMailer::Base
  default from: "ben@reciperoyalty.com"

  def create_recipe(user, recipe, winner, dish)
    @user = user
    @recipe = recipe
    @winner = winner
    @dish = dish
    mail(to: @user.email, subject: "Congratulations - You created a recipe challenge for #{@dish}")
  end

end
