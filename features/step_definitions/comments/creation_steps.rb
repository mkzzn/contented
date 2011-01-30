Given /^I enter the comment "([^"]*)"$/ do |comment|
  fill_in "comment_body", :with => comment
end

Given /^I submit the comment$/ do
  find(:css, "#comment_submit").click
end

Then /^the comment "([^"]*)" should appear on the page$/ do |comment|
  page.should have_xpath("//div[contains(@class, 'comment')]//div[@class='body'][contains(., '#{comment}')]")
end

Given /^I enter an empty comment$/ do
  %Q{Given I enter the comment ""}
end

Then /^I should see errors on the comment field$/ do
  page.should have_xpath("//div[@class='field_with_errors']//textarea[@id='comment_body']")
end

Then /^the comment should not be posted to the page$/ do
  page.should_not have_xpath("//div[@class='comment']//div[@class='body'][contains(.,'')]")
end
