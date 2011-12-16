Given /^unpublished article "([^"]*)" with body "([^"]*)"$/ do |title, body|
  Factory :article, :title => title, :body => body, :published => false
end

When /^I search for keyword "([^"]*)"$/ do |keyword|
  fill_in "Search", :with => keyword
  click "Search"
end

Then /^I should see a message saying there are two results for keyword "([^"]*)"$/ do |keyword|
  page.should have_xpath("//div[@id='search_message'][contains(.,'2 results found for \"#{keyword}\"')]")
end

Then /^I should see a message saying there were no search results$/ do
  page.should have_xpath("//div[@id='search_message'][contains(.,'No results found for \"#{keyword}\"')]")
end
