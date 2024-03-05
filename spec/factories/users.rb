FactoryBot.define do
  factory :user do
    first_name { Faker::Internet.first_name }
    last_name { Faker::Internet.last_name }
    email { Faker::Internet.email }
    password_digest { "password" }
  end
end
