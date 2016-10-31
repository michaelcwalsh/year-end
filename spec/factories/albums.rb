FactoryGirl.define do
  factory :album do
    sequence(:title) { |n| "Generic Album Title #{n}" }
    sequence(:artist) { |n| "Generic Artist Name #{n}" }
    sequence(:rating) { |n| "#{n}" }
    user
  end
end
