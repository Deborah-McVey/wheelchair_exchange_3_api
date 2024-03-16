class Post < ApplicationRecord
    # associations
    belongs_to :user
    has_many :comments
    # validations
    validates :photo, presence: true, uniqueness: true
    validates :description, presence: true, uniqueness: true, length: { minimum: 5, maximum: 1000 }
    validates :location, presence: true, length: { minimum: 10, maximum: 50 }
    validates :status, presence: true
end
