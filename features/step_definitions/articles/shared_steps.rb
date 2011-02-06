Given /^article "([^"]*)"$/ do |title|
  Factory :article, :title => title
end
