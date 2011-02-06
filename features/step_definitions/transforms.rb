Transform /^article "\w+"$/ do |capture|
  title = capture.gsub(/(^article|\")/,"").strip
  Article.find_by_title(title) || Factory(:article, :title => title)
end

Transform /^category "\w+"$/ do |capture|
  title = capture.gsub(/^(category|\")/,"").strip
  Category.find_by_title(title) || Factory(:category, :title => title)
end
