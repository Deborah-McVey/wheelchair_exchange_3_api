FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    user { nil }
    post { nil }
  end
end
