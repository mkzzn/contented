Given /^I enter valid data for an article entitled "([^"]*)"$/ do |title|
  fill_in "article_title", :with => title
  fill_in "article_body", :with => Faker::Lorem.sentence
end

When /^I submit the article$/ do
  find(:css, "#article_submit").click
end

Then /^I should see article "([^"]*)"$/ do |title|
  page.should have_xpath("//div[@class='article']//a[@class='title'][contains(., #{title})]")
end

Then /^I should see a notice saying that article "([^"]*)" was created$/ do |title|
  page.should have_xpath("//div[@class='flash notice'][contains(., #{title})][contains(., 'success')]")
end

Given /^I enter insufficient values for an article$/ do
  fill_in "article_title", :with => ""
  fill_in "article_body", :with => ""
end

Then /^I should see a warning saying that my article was not created$/ do
  page.should have_xpath("//div[@class='flash warning'][contains(., 'failed')]")
end

Given /^I click the link for new article$/ do
  find(:css, "a.new_article").click
end
