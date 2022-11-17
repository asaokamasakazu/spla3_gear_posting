FactoryBot.define do
  factory :favorite do
    user { post.user }
    post
  end
end
