require 'spec_helper'

describe NavigationHelper, "active navigation link helpers" do
  include ActionView::Helpers
  include Haml::Helpers

  context "ActiveParser helpers" do
    before(:each) do
      @active_actions = {:waffles => [:humonzord]}
    end

    context "determining whether the controller/action pair is active" do
      it "should be active if it matches the designated controller/action pairs" do
        self.stub!(:controller_name) { :waffles }
        self.stub!(:action_name) { :humonzord }
        active_action?(@active_actions).should == true
      end

      it "should not be active if the designated controller/action pairs aren't matched" do
        self.stub!(:controller_name) { :pickles }
        self.stub!(:action_name) { :snakemon }
        active_action?(@active_actions).should == false
      end
    end

    context "wrapping the ActionParser in a class response" do
      it "should return the class + 'active' if it's active" do
        self.stub!(:active_action?) { true }
        active_on("douglas", @active_actions).should == "douglas active"
      end

      it "should return just the class if it's not active" do
        self.stub!(:active_action?) { false }
        active_on("douglas", @active_actions).should == "douglas"
      end
    end
  end
end
