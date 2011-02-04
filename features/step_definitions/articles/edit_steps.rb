Given /^article "([^"]*)" has body "([^"]*)"$/ do |title, body|
  article = Article.find_by_title title
  article.update_attributes :body => body
end

When /^I edit article "([^"]*)"$/ do |title|
  article = Article.find_by_title title
  visit edit_article_path(article)
end

Given /^I fill in article "([^"]*)" with "([^"]*)"$/ do |attr, value|
   fill_in "article_#{attr}", :with => value
end

Then /^article "([^"]*)" should have ([^"]*) "([^"]*)"$/ do |title, attr, value|
  article = Article.find_by_title title
  article[attr].should == value
end

Given /^I clear the article title$/ do
  fill_in "article_title", :with => ""
end

Then /^I should be shown that the title has an error$/ do
  page.should have_xpath("//div[@class='field_with_errors']//input[@id='article_title']")
end

Given /^I click "([^"]*)"$/ do |text|
  click_link text
end

Given /^I cancel editing$/ do
  find(:css, "#cancel_editing").click
end

