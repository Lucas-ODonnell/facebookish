class InvitationsController < ApplicationController

  def index
    @invitations = Invitation.select { |invitation| invitation.friend_id == current_user.id }
  end

  def edit 
    @invitation = Invitation.find(params[:id])
    @status_options = possible_statuses
  end

  def update #allows you to confirm or deny the friend request
    @friendship = Friendship.new
    @invitation = Invitation.find(params[:id])
    if @invitation.update(invitation_params) && @invitation.status == "confirm"
      @invitation.confirm
      redirect_to invitations_path(current_user)
    elsif @invitation.update(invitation_params) && @invitation.status == "deny"
      @invitation.deny
      redirect_to invitations_path(current_user)
    else
      render :edit
    end
  end

  def create #creates the invitation default is deny
    @invitation = current_user.invitations.build(friend_id: params[:friend_id])
    if @invitation.save
      redirect_to searches_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    #the reason it has [0] is because its an active record relation. [0] puts us inside the array
    @invitation =  Friendship.where('user_id = ? AND  
                                    friend_id = ?',
                                    current_user.id, params[:id])[0]
    @invitation.destroy
    @invitation = Friendship.where('user_id = ? AND
                                   friend_id = ?',
                                   params[:id], current_user.id)[0]
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
