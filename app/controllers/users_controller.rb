class UsersController < ApplicationController

  def index
    @invitations = current_user.pending_invitations.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    @comments = Comment.all
  end
  
end
