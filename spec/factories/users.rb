FactoryBot.define do
  factory :user do
    username  { FFaker::Internet.user_name }

    email     { FFaker::Internet.email }

    password  { FFaker::Internet.password }

    trait :with_auth_token do
      association :auth_token
    end
  end
end
