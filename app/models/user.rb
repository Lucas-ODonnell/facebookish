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
  has_many :invitations, dependent: :destroy, inverse_of: :creator
  has_many :pending_invitations, -> { where confirmed: false },
    class_name: :Invitation,
    foreign_key: :friend_id,
    dependent: :destroy

  validates :name, presence: true

end
