class InvitationsController < ApplicationController

  def index
    @invitation = current_user.invitations.all
  end

  def create
    @invitation = current_user.invitations.build(friend_id: params[:friend_id])
    if @invitation.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @invitation = current_user.friendships.find(params[:id])
    @invitation.destroy
    redirect_back(fallback_location: root_path)
  end
end
