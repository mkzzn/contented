Given /^writer (user "\w+") has (\d+) articles$/ do |user, article_count|
  user = Factory :user, :
end

Then /^I should see writers "([^"]*)" and "([^"]*)"$/ do |email1, email2|
  pending # express the regexp above with the code you wish you had
end

Given /^user "([^"]*)" doesn't have any articles$/ do |email|

end

Then /^I shouldn't see (user "\w+")$/ do |user|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see (user "\w+")$/ do |user|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "([^"]*)" before "([^"]*)"$/ do |email1, email2|
  pending # express the regexp above with the code you wish you had
end

Given /^(user "\w+") has a bio$/ do |user|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the bio for (user "\w+")$/ do |user|
  pending # express the regexp above with the code you wish you had
end

Given /^I click the link for writer (user "\w+")$/ do |user|
  pending # express the regexp above with the code you wish you had
end

Then /^I should be viewing the writer page for (user "\w+")$/ do |email|
  pending # express the regexp above with the code you wish you had
end
