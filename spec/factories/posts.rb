FactoryBot.define do
  factory :post do
    photo { Faker::Image.urlLoremFlickr }
    description { Faker::Lorem.paragraph }
    location { Faker::America.location }
    statustring { Faker::Internet.username(specifier: 3..20, seperators: %w(_)) }
    user { nil }
  end
end
