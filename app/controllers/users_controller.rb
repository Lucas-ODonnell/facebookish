class UsersController < ApplicationController

  def index
    @invitations = current_user.pending_invitations.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    @comments = Comment.all
    #to get the count of pending requests
    @count = Invitation.where(friend_id: @user.id, status: "deny")
    #invitations where I invited
    @invitations_to = Invitation.where(friend_id: @user.id, status: "confirm")
    #invitations where they invited
    @invitations_from = Invitation.where(user_id: @user.id, status: "confirm")
  end
end
