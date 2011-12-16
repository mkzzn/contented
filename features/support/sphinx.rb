# require 'cucumber/thinking_sphinx/external_world'
# Cucumber::ThinkingSphinx::ExternalWorld.new

# Cucumber::Rails::World.use_transactional_fixtures = false

# Before('@no-txn') do
#   DatabaseCleaner.start
# end

# After('@no-txn') do
#   DatabaseCleaner.clean
# end
 
 # Before do
 #   DatabaseCleaner.clean
 # end
 
 # def sphinx_task(task)
 #   %x{RAILS_ENV=test `which rake` ts:#{task}}
 # end
 
 # Before('@sphinx') do
 #   unless ThinkingSphinx.sphinx_running?
 #     sphinx_task(:config)
 #     sphinx_task(:index)
 #     sphinx_task(:run)
 #   end
 # end
 
 # at_exit do
 #   DatabaseCleaner.clean
   
 #   if ThinkingSphinx.sphinx_running?
 #     sphinx_task(:stop)
 #   end
 # end
