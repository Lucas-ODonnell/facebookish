class Invitation < ApplicationRecord
  belongs_to :creator,
    class_name: "User",
    foreign_key: :user_id,
    inverse_of: :invitations


  enum status: {
    confirm: 1,
    deny: 0
  }
 end
