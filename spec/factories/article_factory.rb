Factory.define :article do |f|
  f.title { Faker::Lorem.sentence }
  f.body { Faker::Lorem.paragraph }
end

