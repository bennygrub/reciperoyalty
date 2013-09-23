class UserMailer < ActionMailer::Base
  default from: "ben@reciperoyalty.com"

  def new_user(user)
    @user = user
    mail(to: "ben@reciperoyalty.com", subject: 'New User Sign Up')
  end
end
