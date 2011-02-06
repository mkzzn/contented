Given /^I am editing (article "\w+")$/ do |article|
  visit edit_article_path(article)
end

Then /^these article categories should be available:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Given /^I select category "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a notice saying that article "([^"]*)" was saved to category "([^"]*)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /^article "([^"]*)" should belong to category "([^"]*)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /^article "([^"]*)" should be uncategorized$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
