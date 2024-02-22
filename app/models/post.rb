class Post < ApplicationRecord
    # associations
    belongs_to :user
    has_many :comments
    # validations
    validates :photo, presence: true
    validates :description, presence: true
    validates :location, presence: true
    validates :status, presence: true
end
