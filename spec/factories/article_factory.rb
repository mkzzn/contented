Factory.define :article do |f|
  f.title { Faker::Lorem.sentence }
  f.body { Faker::Lorem.paragraph }
end

Factory.define :categorized_article, :parent => :article do |f|
  f.association :category
end
