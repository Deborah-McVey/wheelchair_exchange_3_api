class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # validations
  validates :body, presence: true
end
