Given /^category "([^"]*)"$/ do |category|
  Factory :category, :title => category
end

Given /^category "([^"]*)" has article "([^"]*)"$/ do |category, article|
  category = Category.find_by_title category
  Factory :article, :category => category, :title => article
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

