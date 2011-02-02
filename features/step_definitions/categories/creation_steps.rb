Given /^I enter valid data for new category "([^"]*)"$/ do |title|
  fill_in "category_title", :with => title
end

When /^I submit the category$/ do
  find(:css, "#category_submit").click
end

Then /^I should see category "([^"]*)"$/ do |title|
  page.should have_xpath("//div[@class='category'][contains(., '#{title}')]")
end

Given /^I enter an empty category title$/ do
  fill_in "category_title", :with => ""
end

Then /^I should not be on the category index page$/ do
  current_path.should_not == categories_path
end

Then /^I should see a warning saying "([^"]*)"$/ do |message|
  page.should have_xpath("//div[@class='flash warning'][contains(., '#{message}')]")
end

Then /^I should see errors on the category title$/ do
  page.should have_xpath("//div[@class='field_with_errors']//input[@type='text'][@id='category_title']")
end
