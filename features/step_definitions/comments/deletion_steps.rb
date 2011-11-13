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

Given /^(article "\w+") with comment "([^"]*)"$/ do |article, comment_body|
  article.comments.create :body => comment_body
end

Given /^user "([^"]*)" owns (comment "\w+")$/ do |user_email, comment|
  user = User.where(:email => user_email).first
  comment.update_attributes :user_id => user[:id]
end

Given /^user "([^"]*)" does not own (comment "\w+")$/ do |user_email, comment|
  user = User.where(:email => user_email)
  comment.update_attributes :user_id => nil
end

Then /^I should not see the delete link for (comment "\w+")$/ do |comment|
  page.should_not have_css("#comment_#{comment[:id]} .resource_links input.destroy")
end

Then /^I should be able to successfully delete comment "([^"]*)"$/ do |comment|
  Given %Q{I click the delete link for comment "#{comment}"}
  Then %Q{I should see a notice saying "#{comment} has been deleted"}
  And %Q{I should not see the comment "#{comment}"}
end
