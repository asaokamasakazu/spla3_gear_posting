FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    message { Faker::Lorem.characters(number: 50) }
    email { Faker::Internet.email }
  end
end
