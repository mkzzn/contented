FactoryGirl.define do
  factory :comment do
    body { Faker::Lorem.sentence }
    association :article, :factory => :article
  end
end
