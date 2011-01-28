Given /^article "([^"]*)" has body "([^"]*)"$/ do |title, body|
  article = Article.find_by_title title
  article.update_attributes :body => body
end

When /^I edit article "([^"]*)"$/ do |title|
  article = Article.find_by_title title
  visit edit_article_path(article)
end

Given /^I change the title and body of "([^"]*)" to "([^"]*)" and "([^"]*)"$/ do |orig_title, new_title, new_body|
  article = Article.find_by_title orig_title
  article.update_attributes :title => new_title, :body => new_body
end

When /^I submit the changes$/ do
  find(:css, "#article_submit").click
end

Then /^I should be viewing article "([^"]*)"$/ do |title|
  article = Article.find_by_title title
  current_path.should == article_path(article)
end

Then /^article "([^"]*)" should have body "([^"]*)"$/ do |title, body|
  article = Article.find_by_title title
  article[:body].should == body
end

Given /^I clear the article title$/ do
  fill_in "article_title", :with => ""
end

Then /^I should be shown that the title has an error$/ do
  page.should have_xpath("//div[@class='field_with_errors']//input[@id='article_title']")
end
