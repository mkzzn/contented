require 'spec_helper'

describe "users/edit.html.haml" do
  it "should render the error messages partial" do
    assign :user, stub_model(User)
    render
    view.should render_template(:partial => "shared/_error_messages", :count => 1)
  end
end
