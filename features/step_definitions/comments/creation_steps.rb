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

Then /^I should be able to successfully post comment "([^"]*)"$/ do |comment|
  Given %Q{I enter the comment "#{comment}"}
  And %Q{I submit the comment}
  Then %Q{the comment "#{comment}" should appear on the page}
end

Then /^I should be shown an error if I post an empty comment$/ do
  Given %Q{I enter an empty comment}
  And %Q{I submit the comment}
  Then %Q{I should see errors on the comment field}
  And %Q{the comment should not be posted to the page}
end

Given /^I am viewing article"([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should not see the form for posting a comment$/ do
  page.should_not have_css("form#new_comment")
end
