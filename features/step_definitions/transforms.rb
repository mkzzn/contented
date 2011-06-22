Transform /^article "\w+"$/ do |capture|
  title = capture.gsub(/(^article|\")/,"").strip
  Article.find_by_title(title) || Factory(:article, :title => title)
end

Transform /^category "\w+"$/ do |capture|
  title = capture.gsub(/(^category|\")/,"").strip
  Category.find_by_title(title) || Factory(:category, :title => title)
end

Transform /^comment "\w+"$/ do |capture|
  body = capture.gsub(/(^comment|\")/,"").strip
  Comment.find_by_body(body) || Factory(:comment, :body => body)
end

Transform /^user "\w+"$/ do |capture|
  email = capture.gsub(/(^user|\")/,"").strip
  User.find_by_email(email) || Factory(:user, :email => email)
end
