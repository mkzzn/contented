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
  page.should have_xpath("//div[@id='article_#{article[:id]}']//a[@class='category'][contains(.,'#{category[:title]}')]")
end

When /^I click the link to (category "\w+") within (article "\w+")$/ do |category, article|
  find(:xpath, "//div[@id='article_#{article[:id]}']//div[@class='resource_links']//a[@class='category']").click
end

Given /^(article "\w+") is uncategorized$/ do |article|
  article.update_attributes :category_id => nil
end

Then /^(article "\w+") should show that it is uncategorized$/ do |article|
  page.should have_xpath("//div[@id='article_#{article[:id]}']//div[@class='resource_links'][.='Uncategorized']")
end
