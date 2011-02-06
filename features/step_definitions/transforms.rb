# Transform /^article "\w+"$/ do |capture|
#   Article.find_or_create_by_title capture.gsub(/^article /,""), :body => Faker::Lorem.sentence
# end

# Transform /^category "\w+"$/ do |capture|
#   Factory :category, :title => capture.gsub(/^category /,"")
# end

# Transform /^comment "\w+"$/ do |capture|
#   Factory :comment, :title => capture.gsub(/^comment /,"")
# end
