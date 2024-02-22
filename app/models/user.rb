class User < ApplicationRecord
    has_secure_password
    # validations
    validates :email, presence: true, uniqueness: true
    # associations
    has_many :posts
    has_many :comments
end

