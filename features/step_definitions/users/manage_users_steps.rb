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

Then /^I should see that the user "([^"]*)" is an admin$/ do |email|
  user = User.where(:email => email).first
  page.should have_xpath("//tr[@id='user_#{user[:id]}']//td[@class='role'][contains(.,'admin')]")
end

Given /^I change the user role to "([^"]*)"$/ do |role|
  select role, :from => "user_role"
end

Given /^I change the password to "([^"]*)"$/ do |password|
  fill_in "user_password", :with => password
end

Given /^I change the password confirmation to "([^"]*)"$/ do |confirmation|
  fill_in "user_password_confirmation", :with => confirmation
end

Then /^I should see an error saying that the passwords do not match$/ do
  page.should have_xpath("//div[@id='errorExplanation']//li[contains(.,'Password doesn')][contains(.,'match confirmation')]")
end
