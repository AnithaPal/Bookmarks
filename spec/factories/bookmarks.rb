# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bookmark do
    association :topic
    url {Faker::Internet.url('example.com')}
  end
end
