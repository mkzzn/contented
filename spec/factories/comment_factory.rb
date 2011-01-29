Factory.define :comment do |f|
  f.body { Faker::Lorem.sentence }
  f.association :article, :factory => :article
end
