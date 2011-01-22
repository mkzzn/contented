module ApplicationHelper
  def show_flash(options={})
    # set the default tag to a <div> element
    opts = {:tag => :div, :additional_attributes => {}}.merge options
    
    # create a div for each available flash type and display its value
    [:notice, :warning, :message, :failure, :success].collect do |key|
      content_tag(opts[:tag], flash[key], ({:class => "flash flash_#{key} #{key}"}.merge opts[:additional_attributes])) unless flash[key].blank?
    end.join
  end
end
