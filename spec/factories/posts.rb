FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 10) }
    comment { Faker::Lorem.characters(number: 50) }
    head_main { Faker::Number.between(from: 1, to: 14) }
    head_sub1 { Faker::Number.between(from: 1, to: 14) }
    head_sub2 { Faker::Number.between(from: 1, to: 14) }
    head_sub3 { Faker::Number.between(from: 1, to: 14) }
    body_main { Faker::Number.between(from: 1, to: 14) }
    body_sub1 { Faker::Number.between(from: 1, to: 14) }
    body_sub2 { Faker::Number.between(from: 1, to: 14) }
    body_sub3 { Faker::Number.between(from: 1, to: 14) }
    shoes_main { Faker::Number.between(from: 1, to: 14) }
    shoes_sub1 { Faker::Number.between(from: 1, to: 14) }
    shoes_sub2 { Faker::Number.between(from: 1, to: 14) }
    shoes_sub3 { Faker::Number.between(from: 1, to: 14) }
    user
  end
end
