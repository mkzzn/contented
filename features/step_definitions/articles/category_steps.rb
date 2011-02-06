Given /^I am editing (article "\w+")$/ do |article|
  visit edit_article_path(article)
end

Then /^these article categories should be available:$/ do |table|
  table.hashes.each do |hash|
    page.should have_xpath("//select[@id='article_category_id']//option[.='#{hash["category"]}']")
  end
end

Given /^I select category "([^"]*)"$/ do |category_name|
  select category_name, :from => "article_category_id"
end

Then /^I should see a notice saying that article "([^"]*)" was saved to category "([^"]*)"$/ do |article, category|
  page.should have_xpath("//div[@class='flash notice'][contains(.,'#{article} was saved')][contains(.,'category #{category}')]")
end

Then /^(article "\w+") should belong to category "([^"]*)"$/ do |article, category|
  article.category[:title].should == category
end

Then /^(article "\w+") should be uncategorized$/ do |article|
  article.uncategorized?.should == true
end
