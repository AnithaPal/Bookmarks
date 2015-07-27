# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    association :user
    title { Faker::Lorem.sentence }
    
  end
end
