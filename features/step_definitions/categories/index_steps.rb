Given /^category "([^"]*)" with description "([^"]*)"$/ do |title, desc|
  Factory :category, :title => title, :description => desc
end

Given /^category "([^"]*)" has an article entitled "([^"]*)"$/ do |category, article|
  category = Category.find_by_title category
  Factory :article, :title => article, :category => category
end

Given /^I visit the Categories index$/ do
  visit categories_path
end

Then /^I should see article "([^"]*)" within category "([^"]*)"$/ do |article, category|
  page.should have_xpath("//div[@class='category']//div[@class='article']//a[@class='title'][contains(.,'#{article}')]")
end

When /^I click the link for article "([^"]*)"$/ do |article|
  click_link article
end

Then /^I should be viewing the article entitled "([^"]*)"$/ do |article|
  article = Article.find_by_title article
  current_path.should == article_path(article)
end

Given /^article "([^"]*)" is the (.*) article in category "([^"]*)"$/ do |article, number, category|
  order = {"third" => 2, "fourth" => 3}
  @category = Category.find_by_title category
  (order[number] - @category.articles.count).times do
    Factory :article, :category => @category
  end
  Factory :article, :category => @category, :title => article
end

Then /^I should not see article "([^"]*)" within category "([^"]*)"$/ do |article, category|
  page.should have_xpath("//div[@class='category']//div[@class='article']//div[@class='title'][contains(.,'#{article}')]")
end

Given /^I am viewing the homepage$/ do
  visit articles_path
end

Given /^I click the Categories navigation heading$/ do
  pending
end

Then /^I should be viewing the Categories index$/ do
  pending # express the regexp above with the code you wish you had
end
