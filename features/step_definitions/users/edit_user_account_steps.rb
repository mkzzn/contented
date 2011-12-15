Given /^confirmed reader user "([^"]*)" with password "([^"]*)"$/ do |email, password|
  user = Factory(:user, :email => email, :password => password, :password_confirmation => password, :role => "reader")
  user.confirm!
end

When /^I sign in as user "([^"]*)" with password "([^"]*)"$/ do |email, password|
  visit new_user_session_path
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "user_submit"
end

When /^I visit my user account page$/ do
  visit edit_user_registration_path
end

Given /^I fill in "([^"]*)" for my first name$/ do |first_name|
  fill_in "user_first_name", :with => first_name
end

Given /^I enter the current password "([^"]*)"$/ do |password|
  fill_in "user_current_password", :with => password
end

Then /^I should see a notice saying that the user was successfully updated$/ do
  page.should have_xpath("//div[contains(@class,'notice')]")
end

Then /^the user's first name should be "([^"]*)"$/ do |first_name|
  find_field("user_first_name").value.should == first_name
end

Then /^I should see an error explanation saying that a password is required$/ do
  page.should have_css("#error_explanation")
end

Then /^I should not be able to change my role$/ do
  page.should_not have_css("#user_role")
end

Given /^user "([^"]*)" has first name "([^"]*)" and last name "([^"]*)"$/ do |email, first, last|
  user = User.find_by_email email
  user.update_attributes :first_name => first, :last_name => last
end

When /^I am editing user "([^"]*)"$/ do |email|
  user = User.find_by_email email
  visit edit_user_path(user)
end
