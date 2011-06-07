require 'spec_helper'

describe "users/index.html.haml" do
  it "should render a user partial for each user" do
    assign(:users, [stub_model(User), stub_model(User)])
    render
    view.should render_template(:partial => "_user", :count => 2)
  end
end
