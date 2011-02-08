Given /^I am viewing (category "\w+")$/ do |category|
  visit category_path(category)
end

When /^I click to delete the category$/ do
  find(:css, "input.destroy").click
end

Then /^category "([^"]*)" should not exist$/ do |category|
  Category.find_by_title(category).should be_nil
end

Given /^(article "\w+") within (category "\w+")$/ do |article, category|
  article.update_attributes :category_id => category[:id]
end

Then /^I should be sent to the categories index$/ do
  current_path.should == categories_path
end
