Given /^category "([^"]*)" with description "([^"]*)"$/ do |title, desc|
  Category.create :title => title, :description => desc
end

Given /^category "([^"]*)" has an article entitled "([^"]*)"$/ do |category, article|
  category = Category.find_by_title category
  category.articles.create :title => article
end

Given /^I visit the Categories index$/ do
  visit categories_path
end

Then /^I should see article "([^"]*)" within category "([^"]*)"$/ do |article, category|
  page.should have_xpath("//div[@class='category']//div[@class='article']//div[@class='title'][contains(.,'#{article}')'")
end

When /^I click the link for article "([^"]*)"$/ do |article|
  click_link article
end

Then /^I should be viewing the article entitled "([^"]*)"$/ do |article|
  article = Article.find_by_title article
  current_path.should == article_path(article)
end

Given /^article "([^"]*)" is the (.*) article in category "([^"]*)"$/ do |number, article, category|
  order = {"third" => 3, "fourth" => 4}
  @category = Category.find_by_title category
  (order[number] - 1 - @category.articles.count).times do
    @category.articles.create :title => Faker::Lorem.sentence
  end
  @category.articles.create :title => article
end

Then /^I should not see article "([^"]*)" within category "([^"]*)"$/ do |article, category|
  page.should have_xpath("//div[@class='category']//div[@class='article']//div[@class='title'][contains(.,'#{article}')'")
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
