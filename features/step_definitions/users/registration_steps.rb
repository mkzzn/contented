Given /^I enter all valid data for new user "([^"]*)" with password "([^"]*)"$/ do |email, password|
  user = Factory.attributes_for(:user)
  fill_in "user_email", :with => email
  fill_in "user_first_name", :with => user[:first_name]
  fill_in "user_last_name", :with => user[:last_name]
  fill_in "user_password", :with => password
  fill_in "user_password_confirmation", :with => password
end

When /^I submit the registration form$/ do
  find(:css, "#user_submit").click
end

Given /^I fail to enter all valid data for user registration$/ do
  fill_in "user_email", :with => ""
end

Then /^I should see a notice saying that my account was created$/ do
  page.should have_xpath("//div[contains(., 'successfully')][contains(@class, 'notice')]")
end

Then /^I should see a warning on the page$/ do
  page.should have_xpath("//div[@id='error_explanation'][contains(.,'blank')]")
end

Then /^there should be a user called "([^"]*)"$/ do |email|
  User.find_by_email(email).class.should == User
end

Then /^there should not be a user called "([^"]*)"$/ do |email|
  User.find_by_email(email).should be_nil
end
