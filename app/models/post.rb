class Post < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :body, presence: true
end
