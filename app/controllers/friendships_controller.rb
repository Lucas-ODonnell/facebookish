class FriendshipsController < ApplicationController
  def create
    invitation = Invitation.find_by(id: params[:invitation_id])
    invitation.confirm
    redirect_back(fallback_location: root_path)
  end
end
