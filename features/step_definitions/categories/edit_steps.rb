Given /^I am viewing the categories index page$/ do
  visit categories_path
end

When /^I click to edit (category "\w+")$/ do |category|
  find(:xpath, "//div[@id='category_#{category[:id]}']//a[@class='edit']").click
end

Given /^I enter category title "([^"]*)" and description "([^"]*)"$/ do |title, description|
  fill_in "category_title", :with => title
  fill_in "category_description", :with => description
end

Then /^I should be viewing the categories index page$/ do
  current_path.should == categories_path
end

Then /^I should see category "([^"]*)" with description "([^"]*)"$/ do |category, description|
  page.should have_xpath("//div[contains(@class,'category')]//div[@class='description'][contains(.,'#{description}')]")
end

Then /^I should not see category "([^"]*)"$/ do |category|
  page.should_not have_xpath("//div[contains(@class,'category')]//div[@class='description'][contains(.,'#{category}')]")
end

Given /^I clear the category title$/ do
  fill_in "category_title", :with => ""
end

Then /^I should be shown that the category (.*) has an error$/ do |attribute|
  page.should have_xpath("//div[@class='field_with_errors']//input[@id='category_#{attribute}']")
end

Given /^I cancel editing the category$/ do
  find(:css, "#cancel_editing").click
end

Given /^I visit the edit page for (category "\w+")$/ do |category|
  visit edit_category_path(category)
end
