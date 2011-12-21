Given /^writer (user "\w+") has (\d+) articles$/ do |user, article_count|
  article_count.times { Factory :article, :user_id => user[:id] }
end

Then /^I should see writers "([^"]*)" and "([^"]*)"$/ do |email1, email2|
  user1 = user.find_by_email email1
  user2 = user.find_by_email email2
  page.should have_xpath("//div[@class='user'][@id='user_#{user1[:id]}]")
  page.should have_xpath("//div[@class='user'][@id='user_#{user2[:id]}]")
end

Given /^(user "\w+") doesn't have any articles$/ do |user|
  user.articles.destroy_all
end

Then /^I shouldn't see (user "\w+")$/ do |user|
  page.should_not have_xpath("//div[@class='user'][@id='user_#{user[:id]}])")
end

Then /^I should see (user "\w+")$/ do |user|
  page.should have_xpath("//div[@class='user'][@id='user_#{user[:id]}])")
end

Then /^I should see "([^"]*)" before "([^"]*)"$/ do |email1, email2|
  pending # express the regexp above with the code you wish you had
end

Given /^(user "\w+") has a bio$/ do |user|
  user.update_attributes :biography => "Here is some info"
end

Then /^I should see the bio for (user "\w+")$/ do |user|
  page.should have_xpath("//div[@class='user']//div[@class='biography'][contains(.,'#{user[:biography]}')]")
end

Given /^I click the link for writer (user "\w+")$/ do |user|
  click_link user.full_name
end

Then /^I should be viewing the writer page for (user "\w+")$/ do |user|
  page.should == writer_page_path(user)
end
