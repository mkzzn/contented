Given /^(article "\w+") has comment "([^"]*)"$/ do |article, comment|
  article.comments.create :body => comment
end

When /^I click the delete link for (comment "\w+")$/ do |comment|
  find(:xpath, "//div[@id='comment_#{comment[:id]}']//input[contains(@class, 'delete')]").click
end

Then /^I should see a notice saying "([^"]*)"$/ do |message|
  page.should have_xpath("//div[@class='flash notice'][contains(., '#{message}')]")
end

Then /^I should not see the comment "([^"]*)"$/ do |comment_body|
  page.should_not have_xpath("//div[@class='comment']//div[@class='body'][contains(.,'#{comment_body}')]")
end
