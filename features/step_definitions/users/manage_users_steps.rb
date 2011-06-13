When /^I visit the edit page for user "([^"]*)"$/ do |email|
  user = User.where(:email => email).first
  visit edit_user_path(user)
end

Given /^I change the user email to "([^"]*)"$/ do |new_email|
  fill_in "user_email", :with => new_email
end

Then /^I should see a notice saying that the user was updated$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the email field should say "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I change the user role to "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the user "([^"]*)" should be an admin$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
