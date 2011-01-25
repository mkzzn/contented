module ApplicationHelper
  def show_flash
    [:notice, :warning].collect do |key|
      content_tag :div, flash[key], {:class => "flash #{key}"}
    end.join
  end
end
