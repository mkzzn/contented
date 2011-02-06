Given /^I am editing article "([^"]*)"$/ do |title|
  article = Factory :article, :title => title
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

Then /^article "([^"]*)" should belong to category "([^"]*)"$/ do |article, category|
  Article.find_by_title(article).category[:title].should == category
end

Then /^article "([^"]*)" should be uncategorized$/ do |article|
  article = Article.find_by_title article
  article.uncategorized?.should == true
end
