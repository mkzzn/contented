When /^I click on the title for "([^"]*)"$/ do |title|
  click_link title
end

Then /^I should be viewing (article "\w+")$/ do |article|
  current_path.should == article_path(article)
end

Given /^I am viewing (article "\w+")$/ do |article|
  visit article_path(article)
end

Given /^(article "\w+") is within (category "\w+")$/ do |article, category|
  article.update_attributes :category_id => category[:id]
end

Then /^I should see (category "\w+") within (article "\w+")$/ do |category, article|
  page.should have_xpath("//div[@id='article_#{article[:id]}']//div[contains(@class,'active_category')]//a[contains(.,'#{category[:title]}')]")
end

When /^I click the link to (category "\w+") within (article "\w+")$/ do |category, article|
  find(:xpath, "//div[@id='article_#{article[:id]}']//div[contains(@class,'active_category')]//a[contains(.,'#{category[:title]}')]").click
end

Given /^(article "\w+") is uncategorized$/ do |article|
  article.update_attributes :category_id => nil
end

Then /^(article "\w+") should show that it is uncategorized$/ do |article|
  page.should have_xpath("//div[@id='article_#{article[:id]}']//div[contains(@class,'active_category')]//a[.='Uncategorized']")
end

When /^I click the uncategorized link within (article "\w+")$/ do |article|
  find(:xpath, "//div[@id='article_#{article[:id]}']//div[contains(@class,'active_category')]//a[.='Uncategorized']").click
end

Then /^I should see the link to edit the article$/ do
  page.should have_css(".article .resource_links a.edit")
end

Then /^I should not see the link to edit the article$/ do
  page.should_not have_css(".article .resource_links a.edit")
end

Given /^(article "\w+") has markdown\-headline "([^"]*)" in its body$/ do |article, headline|
  article.update_attributes :body => "###{headline}"
end

Then /^the article body should contain the headline "([^"]*)"$/ do |headline|
  page.should have_xpath("//div[@class='body']//h2[contains(.,'#{headline}')]")
end

Then /^the page url should contain "([^"]*)"$/ do |slugged_title|
  current_path.should include(slugged_title)
end

Given /^I visit article "([^"]*)"$/ do |title|
  article = Article.find_by_title title
  visit article_path(article)
end

Given /^I am viewing the article entitled "([^"]*)"$/ do |title|
  article = Article.find_by_title title
  visit article_path(article)
end

Given /^an article entitled "([^"]*)"$/ do |title|
  Factory :article, :title => title, :published => true
end
