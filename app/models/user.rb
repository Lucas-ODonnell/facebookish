class User < ApplicationRecord
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :invitations, class_name: "Invitation", 
    foreign_key: :user_id, 
    inverse_of: :creator,
    dependent: :destroy
  has_many :pending_invitations, 
    class_name: :Invitation,
    foreign_key: :friend_id,
    dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, dependent: :destroy
  validates :name, :avatar, presence: true


end
