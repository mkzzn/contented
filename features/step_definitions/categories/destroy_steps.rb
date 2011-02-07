Given /^I am viewing (category "\w+")$/ do |category|
  visit category_path(category)
end

When /^I click to delete the category$/ do
  find(:css, "input.destroy").click
end

Then /^(category "\w+") should not exist$/ do |category|
  category.should be_nil
end

Given /^(article "\w+") within (category "\w+")$/ do |article, category|
  article.update_attributes :category_id => category[:id]
end

When /^I delete (category "\w+")$/ do |category|
  category.destroy  
end
