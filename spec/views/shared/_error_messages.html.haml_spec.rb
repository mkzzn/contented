require 'spec_helper'

describe "shared/_error_messages.html.haml" do
  context "target has no errors" do
    it "should not render an error explanation" do
      view.stub_chain("target", "errors", "any?") { false }
      render
      rendered.should_not =~ /<div id='errorExplanation'>/
    end
  end

  context "target has errors" do
    it "should render an error explanation" do
      view.stub_chain("target", "errors", "any?") { true }
      render
      rendered.should =~ /<div id='errorExplanation'>/
    end
  end

  context "target has one error" do
  end

  context "target has multiple errors" do
  end
end
