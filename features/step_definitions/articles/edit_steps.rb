Given /^(article "\w+") has body "([^"]*)"$/ do |article, body|
  article.update_attributes :body => body
end

When /^I edit (article "\w+")$/ do |article|
  visit edit_article_path(article)
end

Given /^I fill in article "([^"]*)" with "([^"]*)"$/ do |attr, value|
   fill_in "article_#{attr}", :with => value
end

Then /^(article "\w+") should have ([^"]*) "([^"]*)"$/ do |article, attr, value|
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

Given /^article "([^"]*)" with body "([^"]*)"$/ do |title, body|
  Factory :article, :title => title, :body => body
end

Given /^I visit the edit page for (article "\w+")$/ do |article|
  visit edit_article_path(article)
end

When /^I select a file to upload$/ do
  attach_file(:article_assets_attributes_0_asset, File.join(RAILS_ROOT, 'features', 'upload_files', 'anemone.jpg'))
end

Then /^(article "\w+") should have one asset$/ do |article|
  puts article.title
  puts article.assets.count
  article.assets.count.should == 1
end
