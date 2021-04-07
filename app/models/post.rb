class Post < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  belongs_to :user
  validates :body, presence: true
end
