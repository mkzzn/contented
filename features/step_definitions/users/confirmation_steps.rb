Given /^user "([^"]*)"$/ do |login|
  Factory :user, :login => login
end

Given /^I enter login "([^"]*)" and its confirmation token$/ do |login|
  fill_in :login, :with => login
  user = User.find_by_login login
  fill_in :confirmation, :with => user.perishable_token
end

Given /^I enter login "([^"]*)" and an invalid confirmation token$/ do |login|
  fill_in :login, :with => login
  fill_in :confirmation, :with => "invalid!!!"
end

When /^I submit the confirmation$/ do
  find(:css, "input[type='submit']").click
end

Then /^I should still be on the confirmation page$/ do
  current_path.should == confirmations_path
end

Then /^I should see that I'm logged in as user "([^"]*)"$/ do |login|
  pending
end

Then /^I should see that I am not logged in$/ do
  pending # express the regexp above with the code you wish you had
end
