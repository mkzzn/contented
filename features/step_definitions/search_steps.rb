# Given /^a clean slate$/ do
#   # ActiveRecord::Base.descendants.each do |model|
#   #   next unless model.table_exists?
#   #   model.connection.execute "TRUNCATE #{model.table_name}"
#   # end
# end

# Given /^the (\w+) indexes are processed$/ do |model|
#   # model = model.titleize.gsub(/\s/, '').constantize
#   # ThinkingSphinx::Test.index *model.sphinx_index_names
# end
