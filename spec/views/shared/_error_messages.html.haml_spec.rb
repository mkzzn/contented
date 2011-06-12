require 'spec_helper'

describe "shared/_error_messages.html.haml" do
  context "target has no errors" do
    it "should not render an error explanation" do
      target = mock_target
      target.stub_chain("errors", "any?") { false }
      view.stub!(:target) { target }
      render
      rendered.should_not =~ /<div id='errorExplanation'>/
    end
  end

  context "target has errors" do
    before(:each) do
      @target = mock_target
      @target.stub! :errors => mock("errors").as_null_object
      view.stub!(:target) { @target }
    end

    it "should render an error explanation" do
      @target.stub_chain("errors", "any?") { true }
      render
      rendered.should =~ /<div id='errorExplanation'>/
    end

    it "should refer to the target by class" do
      @target.stub!(:class) { User }
      render
      rendered.should =~ /user/
    end

    context "target has one error" do
      it "should singularize the message" do
        @target.stub_chain("errors", "count") { 1 }
        render
        rendered.should =~ /1 error/
      end
    end

    context "target has multiple errors" do
      it "should pluralize the message" do
        @target.stub_chain("errors", "count") { 2 }
        render
        rendered.should =~ /2 errors/
      end
    end
  end

  def mock_target(stubs={})
    mock("target").as_null_object.tap do |target|
      target.stub(stubs) unless stubs.empty?
    end
  end
end
