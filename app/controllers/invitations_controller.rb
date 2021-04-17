class InvitationsController < ApplicationController

  def index
    @invitations = Invitation.select { |invitation| invitation.friend_id == current_user.id }
  end

  def edit 
    @invitation = Invitation.find(params[:id])
    @status_options = possible_statuses
    @invitation.confirm
  end

  def update
    @friendship = Friendship.new
    @invitation = Invitation.find(params[:id])
    if @invitation.update(invitation_params)
      redirect_to invitations_path(current_user)
    else
      render :edit
    end
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

  private

  def possible_statuses
    Invitation.statuses.map { |k, _v| [k.capitalize, k] }
  end


  def invitation_params
    params.require(:invitation).permit(:status)
  end
end
