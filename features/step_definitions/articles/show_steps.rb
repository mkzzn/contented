Given /^an article entitled "([^"]*)"$/ do |title|
  Factory :article, :title => title
end

When /^I click on the title for "([^"]*)"$/ do |title|
  click_link title
end

Then /^I should be viewing article "([^"]*)"$/ do |title|
  article = Article.find_by_title(title)
  current_path.should == article_path(article)
end

Given /^I am viewing the show article page for "([^"]*)"$/ do |title|
  article = Article.find_by_title(title)
  visit article_path(article)
end

