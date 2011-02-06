Transform /^article "\w+"$/ do |transform|
  Factory :article, :title => transform.gsub(/^article /,"")
end
