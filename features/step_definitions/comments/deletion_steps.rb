Given /^article "([^"]*)" has comment "([^"]*)"$/ do |article, comment|
  article = Article.find_by_title article
  article.comments.create :body => comment
end

When /^I click the delete link for comment "([^"]*)"$/ do |comment_body|
  comment = Comment.find_by_body comment_body
  find(:xpath, "//div[@id='comment_#{comment[:id]}']//a[@class='delete']").click
end

Then /^I should see a notice saying "([^"]*)"$/ do |message|
  page.should have_xpath("//div[@class='flash notice'][contains(., #{message})]")
end

Then /^I should not see comment "([^"]*)"$/ do |comment_body|
  page.should_not have_xpath("//div[@class='comment']//div[@class='body'][contains(.,'#{comment_body}')]")
end
