Given /^(article "\w+") has an attachment$/ do |article|
  attachment = Factory.build :attachment, :attachable => article
  attachment.asset = File.open(File.join(RAILS_ROOT, 'features', 'upload_files', 'anemone.jpg'))
  attachment.save
end

Given /^I select the featured image$/ do
  attachment = Attachment.find_by_asset "anemone.jpg"
  select attachment[:id].to_s, :from => "Featured Image"
end

Given /^I select no featured image$/ do
  select "None", :from => "Featured Image"
end

Then /^(article "\w+") should have a featured image$/ do |article|
  page.should have_xpath("//div[@id='article_#{article[:id]}'][contains(@class,'article')]//img[contains(@src,'anemone.jpg')]")
end

Then /^(article "\w+") should not have a featured image$/ do |article|
  page.should_not have_xpath("//div[@id='article_#{article[:id]}'][contains(@class,'article')]//img[contains(@src,'anemone.jpg')]")
end

Given /^the attachment for (article "\w+") is selected as a featured image$/ do |article|
  article.update_attributes :featured_image_id => article.attachments.first[:id]
end
