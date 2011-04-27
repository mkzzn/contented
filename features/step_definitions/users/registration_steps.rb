Given /^I enter all valid data for new user "([^"]*)" with password "([^"]*)"$/ do |login, password|
  user = Factory.attributes_for(:user)
  fill_in "user_login", :with => login
  fill_in "user_email", :with => user[:email]
  fill_in "user_first_name", :with => user[:first_name]
  fill_in "user_last_name", :with => user[:last_name]
  fill_in "user_password", :with => password
  fill_in "user_password_confirmation", :with => password
end

When /^I submit the registration form$/ do
  find(:css, "#user_submit").click
end

Given /^I fail to enter all valid data for user registration$/ do
  fill_in "user_login", :with => ""
end

Then /^I should not be logged in$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^there should be a user called "([^"]*)"$/ do |login|
  User.find_by_login(login).class.should == User
end

Then /^there should not be a user called "([^"]*)"$/ do |login|
  User.find_by_login(login).should be_nil
end
