Given /^I enter valid data for an article entitled "([^"]*)"$/ do |title|
  fill_in "article_title", :with => title
  fill_in "article_body", :with => "Something Else"
end

When /^I submit the article$/ do
  find(:css, "#article_submit").click
end

Then /^I should see article "([^"]*)"$/ do |title|
  page.should have_xpath("//h2[@class=title][contains(., #{title})]")
end

Then /^I should see a notice saying that article "([^"]*)" was created$/ do |title|
  pending # express the regexp above with the code you wish you had
end

Given /^I enter insufficient values for an article$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a warning saying that my article was not created$/ do
  pending # express the regexp above with the code you wish you had
end
