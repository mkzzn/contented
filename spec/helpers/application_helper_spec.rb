require 'spec_helper'

describe ApplicationHelper, "flash helpers" do
  include ActionView::Helpers
  include Haml::Helpers

  context "no flash messages exist" do
    it "should return an empty string" do
      show_flash.should be_empty
    end
  end

  context "flash messages exist" do
    context "notice exists" do
      it "should return a div tag with the notice" do
        flash[:notice] = "wowza!"
        show_flash.should == content_tag(:div, "wowza!", :class => "flash notice")
      end
    end

    context "warning exists" do
      it "should return a div tag with the warning" do
        flash[:warning] = "howdy!"
        show_flash.should == content_tag(:div, "howdy!", :class => "flash warning")
      end
    end

    context "alert exists" do
      it "should return a div tag with the alert" do
        flash[:alert] = "howdy!"
        show_flash.should == content_tag(:div, "howdy!", :class => "flash alert")
      end
    end

    context "both warning and notice exist" do
      it "should return a div tag with the warning" do
        flash[:notice] = "wowza!"
        flash[:warning] = "howdy!"
        flash[:alert] = "zoiks!"
        notice = content_tag(:div, "wowza!", :class => "flash notice")
        warning = content_tag(:div, "howdy!", :class => "flash warning")
        alert = content_tag(:div, "zoiks!", :class => "flash alert")
        show_flash.should == [notice, warning, alert].join
      end
    end
  end
end
