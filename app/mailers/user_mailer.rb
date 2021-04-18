class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = 'http://facebookish.com/welcome'
    mail(to: @user.email, subject: "Weolcome to Facebookish!")
  end
end
