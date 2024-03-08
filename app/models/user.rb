class User < ApplicationRecord
    has_secure_password
    # validations
    validates :email, presence: true, uniqueness: true, length: { minimum: 7, maximum: 30 }, 
    format: {
        with: URI::MailTo::EMAIL_REGEXP
    }
    validates :first_name, presence: true
    validates :last_name, presence: true
    # associations
    has_many :posts
    has_many :comments
end

