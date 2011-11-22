When /^I select a file to upload$/ do
  attach_file(:article_assets_attributes_0_asset, File.join(RAILS_ROOT, 'features', 'upload_files', 'anemone.jpg'))
end

Then /^(article "\w+") should have one asset$/ do |article|
  puts article.title
  puts article.assets.count
  article.assets.count.should == 1
end

Then /^I should see a thumbnail of the asset that I uploaded$/ do
  pending # express the regexp above with the code you wish you had
end
