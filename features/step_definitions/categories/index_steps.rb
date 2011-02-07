Given /^category "([^"]*)" with description "([^"]*)"$/ do |title, desc|
  Factory :category, :title => title, :description => desc
end

Given /^(category "\w+") has an article entitled "([^"]*)"$/ do |category, title|
  Factory :article, :title => title, :category => category
end

Then /^I should see article "([^"]*)" within (category "\w+")$/ do |article, category|
  page.should have_xpath("//div[@id='category_#{category[:id]}']//div[@class='article']//a[@class='title'][contains(.,'#{article}')]")
end

Then /^I should not see article "([^"]*)" within category "([^"]*)"$/ do |article, category|
  page.should_not have_xpath("//div[@class='category']//div[@class='article']//div[@class='title'][contains(.,'#{article}')]")
end

When /^I click to visit article "([^"]*)"$/ do |article|
  click_link article
end

Given /^article "([^"]*)" is the (.*) article in (category "\w+")$/ do |article, number, category|
  order = {"third" => 2, "fourth" => 3}
  (order[number] - category.articles.count).times do
    Factory :article, :category => category
  end
  Factory :article, :category => category, :title => article
end

Given /^I am viewing the homepage$/ do
  visit articles_path
end

Given /^I click the categories navigation heading$/ do
  find(:xpath, "//div[@class='navigation primary']//li[@class='title']//a[contains(@class, 'categories')]").click
end
