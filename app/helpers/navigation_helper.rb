module NavigationHelper
  def active_on(klass, controllers={})
    active_action?(controllers) ? "#{klass} active" : klass
  end

  require 'action_parser'
  def active_action?(controllers={})
    ActionParser.new(controller_name, action_name, controllers).active?
  end
end
