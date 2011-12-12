FactoryGirl.define do
  factory :category do
    title { Faker::Lorem.sentence }
  end
end
