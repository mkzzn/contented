Given /^user "([^"]*)" with confirmation token "([^"]*)"$/ do |login, token|
  Factory :user, :login => login, :perishable_token => token
end

Given /^I enter login "([^"]*)" and confirmation token "([^"]*)"$/ do |login, token|
  fill_in :user_token, :with => login
  fill_in :user_confirmation_token, :with => token
end

When /^I submit the confirmation$/ do
  find(:css, "input[type='submit']").click
end

Then /^I should see that I'm logged in as user "([^"]*)"$/ do |login|
  pending
end

Then /^I should see that I am not logged in$/ do
  pending # express the regexp above with the code you wish you had
end
