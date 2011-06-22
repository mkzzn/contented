Given /^I am logged in as a confirmed admin user$/ do
  Given %Q{confirmed admin user "waldorf@salad.biz" with password "cambodia"}
  And %Q{I sign in as user "waldorf@salad.biz" with password "cambodia"}
end

Given /^I am logged in as a confirmed reader user$/ do
  Given %Q{confirmed reader user "bob@harris.org" with password "translation"}
  And %Q{I sign in as user "bob@harris.org" with password "translation"}
end

Given /^I am logged in as confirmed reader user "([^"]*)"$/ do |email|
  Given %Q{confirmed reader user "#{email}" with password "translation"}
  And %Q{I sign in as user "#{email}" with password "translation"}
end

Given /^I am not logged in$/ do
  visit "/users/sign_out"
end
