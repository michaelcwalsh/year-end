FactoryGirl.define do
  factory :user do
    name "Michael C Walsh"
    sequence(:username) { |n| "michaelcwalsh#{n}" }
    sequence(:email) { |n| "michael#{n}@gmail.com" }
    password "123456"
    location "Boston, MA"
    bio "Hello, World!"
  end
end
