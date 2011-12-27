Given /^writer (user "[\w\@\.]+") has (\d+) published articles$/ do |user, article_count|
  article_count.to_i.times { Factory :published_article, :user_id => user.id }
end

Then /^I should see writers "([^"]*)" and "([^"]*)"$/ do |email1, email2|
  user1 = User.find_by_email email1
  user2 = User.find_by_email email2
  page.should have_xpath("//div[@class='user'][@id='user_#{user1[:id]}']")
  page.should have_xpath("//div[@class='user'][@id='user_#{user2[:id]}']")
end

Given /^(user "[\w\@\.]+") doesn't have any articles$/ do |user|
  user.articles.destroy_all
end

Then /^I shouldn't see (user "[\w\@\.]+")$/ do |user|
  page.should_not have_xpath("//div[@class='user'][@id='user_#{user[:id]}']")
end

Then /^I should see (user "[\w\@\.]+")$/ do |user|
  page.should have_xpath("//div[@class='user'][@id='user_#{user[:id]}']")
end

Then /^I should see (user "[\w\@\.]+") before (user "[\w\@\.]+")$/ do |user1, user2|
  page.should have_xpath("//div[@id='writers']/div[1][@class='user'][@id='user_#{user1[:id]}']")
  page.should have_xpath("//div[@id='writers']/div[2][@class='user'][@id='user_#{user2[:id]}']")
end

Given /^(user "[\w\@\.]+") has a bio$/ do |user|
  user.update_attributes :biography => "Here is some info"
end

Then /^I should see the bio for (user "[\w\@\.]+")$/ do |user|
  page.should have_xpath("//div[@class='user']//div[@class='biography'][contains(.,'#{user[:biography]}')]")
end

Given /^I click the link for writer (user "[\w\@\.]+")$/ do |user|
  click_link user.full_name
end

Then /^I should be viewing the writer page for (user "[\w\@\.]+")$/ do |user|
  current_path.should == writer_path(user)
end

Given /^writer (user "[\w\@\.]+") has name "([^"]*)"$/ do |user, name|
  first_name, last_name = name.split
  user.update_attributes :first_name => first_name, :last_name => last_name
end
