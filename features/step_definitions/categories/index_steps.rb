Given /^category "([^"]*)" with description "([^"]*)"$/ do |title, desc|
  Factory :category, :title => title, :description => desc
end

Given /^(category "\w+") contains (article "\w+")$/ do |category, article|
  article.update_attributes :category => category
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
  Factory :article, :category => category, :title => article, :published => true
end

Given /^I am viewing the homepage$/ do
  visit articles_path
end

Given /^I click the categories navigation heading$/ do
  find(:css, "#navigation div.section.categories a.categories.title").click
end

When /^I click the link to edit (category "\w+")$/ do |category|
  find(:css, "#category_#{category[:id]} a.edit").click 
end

Then /^I should not see an edit link for (category "\w+")$/ do |category|
  page.should_not have_css("#category_#{category[:id]} a.edit")
end
