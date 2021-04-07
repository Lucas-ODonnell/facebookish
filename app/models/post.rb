class Post < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  validates :body, presence: true
end
