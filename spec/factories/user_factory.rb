Factory.define :user do |f|
  f.login { Faker::Internet.user_name }
  f.email { Faker::Internet.email }
  f.first_name { Faker::Name.first_name }
  f.last_name { Faker::Name.last_name }
  f.password { "password" }
  f.password_confirmation { "password" }
end