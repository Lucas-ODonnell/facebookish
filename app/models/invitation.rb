class Invitation < ApplicationRecord
  belongs_to :creator,
    class_name: "User",
    foreign_key: :user_id,
    inverse_of: :invitations

  belongs_to :acceptor,
    class_name: "User",
    foreign_key: :friend_id,
    inverse_of: :pending_invitations


  enum status: {
    confirm: 1,
    deny: 0
  }

  def confirm
    acceptor.friends << creator
    creator.friends << acceptor
  end
end

