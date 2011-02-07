When /^I view (article "\w+")$/ do |article|
  visit article_path(article)
end

When /^I click delete$/ do
  find(:css, "input.destroy").click
end

Then /^I should see a notice seeing that "([^"]*)" was deleted$/ do |title|
  page.should have_xpath("//div[@class='flash notice'][contains(.,'destroyed')]")
end

Then /^there should be no article called "([^"]*)"$/ do |title|
  Article.find_by_title(title).should be_nil
end
