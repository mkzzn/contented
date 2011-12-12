FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end

  factory :categorized_article, :parent => :article do
    association :category
  end
end 
