When /^I visit the edit page for user "([^"]*)"$/ do |email|
  user = User.where(:email => email).first
  visit edit_user_path(user)
end

Given /^I change the user email to "([^"]*)"$/ do |new_email|
  fill_in "user_email", :with => new_email
end

Then /^I should see a notice saying that the user was updated$/ do
  page.should have_xpath('//div[contains(@class,"notice")][contains(.,"success")][contains(.,"updated")]')
end

Then /^I should see the user "([^"]*)"$/ do |email|
  user = User.where(:email => email).first
  page.should have_css("#user_#{user[:id]}")
end

Then /^I should see that the user "([^"]*)" is an admin$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I change the user role to "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
