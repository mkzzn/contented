Given /^category "([^"]*)"$/ do |category|
  Factory :category, :title => category
end

Given /^category "([^"]*)" has (article "\w+")$/ do |category, article|
  category = Category.find_by_title category
  article.update_attributes :category => category
end

When /^I click the title of category "([^"]*)"$/ do |title|
  category = Category.find_by_title title
  find(:css, "#category_#{category[:id]} .title a").click
end

Then /^I should be viewing category "([^"]*)"$/ do |title|
  category = Category.find_by_title title
  current_path.should == category_path(category)
end

When /^I visit the show page for category "([^"]*)"$/ do |title|
  category = Category.find_by_title title
  visit category_path(category)
end

Then /^I should see the delete link for (category "\w+")$/ do |category|
  find(:css, "#category_#{category[:id]} input.destroy").click 
end

Then /^I should not see an delete link for (category "\w+")$/ do |category|
  page.should_not have_css("#category_#{category[:id]} input.destroy")
end

Given /^I am viewing the category entitled "([^"]*)"$/ do |title|
  category = Category.find_by_title title
  visit category_path(category)
end

Given /^an category entitled "([^"]*)"$/ do |title|
  Factory :category, :title => title, :published => true
end
