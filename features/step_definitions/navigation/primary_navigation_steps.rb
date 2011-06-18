When /^I click the "([^"]*)" link$/ do |link_name|
  click_link link_name
end

Then /^I should still be on the homepage$/ do
  current_path.should == "/"
end

When /^I click the link to create a new article$/ do
  find(:css, "a.new_article").click
end

Then /^I should not see a link to create a new article$/ do
  page.should_not have_css("a.new_article")
end

Then /^I should not see a link to create a new category$/ do
  page.should_not have_css("a.new_category")
end

Then /^when I type the URL for the new articles page in the browser$/ do
  visit new_article_path
end

Then /^when I type the URL for the new categories page in the browser$/ do
  visit new_category_path
end

Then /^I should be redirected to the homepage$/ do
  current_path.should == "/"
end

Then /^I should see a warning saying that I cannot view that page$/ do
  page.should have_xpath("//div[contains(@class,'alert')][contains(.,'You are not authorized to access this page.')]")
end

When /^I click the link to create a new category$/ do
  find(:css, "a.new_category").click
end
