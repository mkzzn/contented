When /^I click on the title for "([^"]*)"$/ do |title|
  click_link title
end

Then /^I should be viewing (article "\w+")$/ do |article|
  current_path.should == article_path(article)
end

Given /^I am viewing (article "\w+")$/ do |article|
  visit article_path(article)
end
