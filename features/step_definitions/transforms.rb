Transform /^article "\w+"$/ do |capture|
  Factory :article, :title => capture.gsub(/^article /,"")
end

Transform /^category "\w+"$/ do |capture|
  Factory :category, :title => capture.gsub(/^category /,"")
end

Transform /^comment "\w+"$/ do |capture|
  Factory :comment, :title => capture.gsub(/^comment /,"")
end
