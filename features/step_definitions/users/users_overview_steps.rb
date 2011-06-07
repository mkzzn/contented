Given /^confirmed admin user "([^"]*)" with password "([^"]*)"$/ do |email, password|
  Factory(:user, :email => email, :password => password,
          :password_confirmation => password, :role => "admin").confirm!
end

When /^I visit the users overview page$/ do
  visit users_path
end

Then /^I should see a warning saying that I cannot access that page$/ do
  page.should have_css("div.warning")
end

Given /^there are three users in the system$/ do
  (3 - User.count).times { Factory :user }
end

When /^I login as a confirmed admin user$/ do
  Given %{confirmed admin user "waldorf@salad.biz" with password "cambodia"}
  Given %{I sign in as user "waldorf@salad.biz" with password "cambodia"}
end

Then /^I should see three users on the page$/ do
  page.should have_xpath("//tr[contains(@class,'user')][3]")
end
