module ApplicationHelper
  def show_flash
    [:notice, :warning, :alert].collect do |key|
      content_tag :div, flash[key], {:class => "flash #{key}"} if flash[key]
    end.compact.join
  end

  def markdown(text)
    require 'rdiscount'
    RDiscount.new(text).to_html.html_safe rescue ""
  end
end
