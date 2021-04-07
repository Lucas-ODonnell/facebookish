class Post < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  has_many :comments
  belongs_to :user
  validates :body, presence: true
end
