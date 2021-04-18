class RegistrationsController < Devise::RegistrationsController

  def create
    super
    #UserMailer.with(user: @user).welcome_email.deliver_now if @user.persisted? This is how you do the email, but it's annoying
  end
  private

  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end
