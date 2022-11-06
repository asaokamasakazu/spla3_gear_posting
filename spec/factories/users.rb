FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    rank { Faker::Number.between(from: 1, to: 999) }
    profile { Faker::Lorem.characters(number: 50) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
