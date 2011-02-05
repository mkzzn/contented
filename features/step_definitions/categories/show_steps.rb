Given /^category "([^"]*)"$/ do |category|
  Factory :category, :title => category
end

Given /^category "([^"]*)" has article "([^"]*)"$/ do |category, article|
  category = Category.find_by_title category
  Factory :article, :category => category, :title => article
end

When /^I visit the show page for category "([^"]*)"$/ do |category|
  visit category
end

Then /^I should see articles "([^"]*)" and "([^"]*)"$/ do |arg1, arg2|
  page.should_have
end
