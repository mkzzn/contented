Given /^(article "\w+") was written on "([^"]*)"$/ do |article, unparsed_date|
  article.update_attributes :created_at => Date.parse(unparsed_date)
end

Then /^I should see that (article "\w+") was created on "([^"]*)"$/ do |article, date|
  page.should have_xpath("//div[@id=\"article_#{article[:id]}\"]//div[@class=\"date\"][contains(., \"#{date}\")]")
end

Given /^(article "\w+") was written by "([^"]*)"$/ do |article, author_name|
  first_name, last_name = author_name.split
  user = Factory :user, :first_name => first_name, :last_name => last_name
  article.update_attributes :user_id => user[:id]
end

When /^I should see that (article "\w+") was written by "([^"]*)"$/ do |article, author_name|
  first_name, last_name = author_name.split
  page.should have_xpath("//div[@class='author'][contains(.,'#{author_name}')]")
end

Given /^(article "\w+") has (\d+) comments$/ do |article, count|
  count.to_i.times { article.comments.create :body => "humons!" }
end

Then /^I should see that (article "\w+") has (\d+) comments$/ do |article, count|
  extend ActionView::Helpers::TextHelper
  link_text = pluralize(count, "comment")
  page.should have_xpath("//div[@id='article_#{article[:id]}']//div[@class='comments']//a[contains(.,'#{link_text}')]")
end

When /^I click on the comments link for (article "\w+")$/ do |article|
  find(:css, "#article_#{article[:id]} .comments a").click
end

Then /^I should be viewing the comments section for (article "\w+")$/ do |article|
  current_path.should == article_path(article)
end
