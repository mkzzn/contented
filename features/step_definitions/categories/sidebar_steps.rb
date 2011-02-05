Given /^category "([^"]*)" has (\d+) other articles$/ do |category, articles|
  category = Category.find_by_title category
  articles.to_i.times { Factory :article, :category => category }
end

Then /^I should see category "([^"]*)" in the sidebar$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^category "([^"]*)" should show that it has (\d+) articles$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When /^I click category "([^"]*)" in the sidebar$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
