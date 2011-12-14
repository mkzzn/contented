When /^I create a new, published article called "([^"]*)"$/ do |title|
  Given %Q{I am on the new article page}
  And %Q{I enter valid data for a published article entitled "#{title}"}
  When %Q{I submit the article}
end

Then /^(article "\w+") should be published$/ do |article|
  page.should have_xpath("//div[@id='article_#{article[:id]}']//div[@class='published'][contains(.,'Published')]")
end

Then /^(article "\w+") should be unpublished$/ do |article|
  page.should have_xpath("//div[@id='article_#{article[:id]}']//div[@class='published'][contains(.,'Unpublished')]")
end

When /^I create a new, unpublished article called "([^"]*)"$/ do |title|
  Given %Q{I am on the new article page}
  And %Q{I enter valid data for an unpublished article entitled "#{title}"}
  When %Q{I submit the article}
end

Given /^unpublished article "([^"]*)"$/ do |title|
  Factory :article, :title => title, :published => false
end

When /^I publish (article "\w+")$/ do |article|
  visit edit_article_path(article)
  check "Published"
  When %Q{I submit the article}
end

When /^I got to the homepage$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^published article "([^"]*)"$/ do |title|
  Factory :article, :title => title, :published => true
end

When /^I unpublish (article "\w+")$/ do |article|
  visit edit_article_path(article)
  uncheck "Published"
  When %Q{I submit the article}
end

Then /^I should see a warning saying that I cannot view article "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I visit article ("\w+")$/ do |article|
  pending # express the regexp above with the code you wish you had
end

When /^I enter valid data for a published article entitled "([^"]*)"$/ do |title|
  fill_in "article_title", :with => title
  fill_in "article_body", :with => Faker::Lorem.sentence
  check "Published"
end

When /^I enter valid data for an unpublished article entitled "([^"]*)"$/ do |title|
  fill_in "article_title", :with => title
  fill_in "article_body", :with => Faker::Lorem.sentence
  uncheck "Published"
end

Then /^I should not see (article "\w+")$/ do |article|
  page.should_not have_css("#article_#{article[:id]}")
end

