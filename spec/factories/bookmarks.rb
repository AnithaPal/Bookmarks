# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bookmark do
    association :topic
    url { Faker::Internet.url('example.com') }
    title { Faker::Lorem.words }
  end
end
