FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end

  factory :categorized_article, :parent => :article do
    association :category
  end

  factory :published_article, :parent => :article do
    published { true }
  end

  factory :unpublished_article, :parent => :article do
    published { false }
  end
end 
