module ApplicationHelper
  def show_flash
    [:notice, :warning].collect do |key|
      content_tag :div, flash[key], {:class => "flash #{key}"} if flash[key]
    end.compact.join
  end

  # TODO: implement after adding tests

  # def active_on(klass, controllers={})
  #   active_action?(controllers) ? "#{klass} active" : klass
  # end

  # require 'action_parser'
  # def active_action?(controllers={})
  #   ActionParser.new(controller_name, action_name, controllers).active?
  # end
end
