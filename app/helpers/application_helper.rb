module ApplicationHelper
  def show_flash
    [:notice, :warning, :alert].collect do |key|
      content_tag :div, flash[key], {:class => "flash #{key}"} if flash[key]
    end.compact.join
  end
end
