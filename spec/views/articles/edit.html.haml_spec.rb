require 'spec_helper'

describe "articles/edit.html.haml" do
  it "should render the form" do
    view.should render_partial("_form", :count => 1)
  end
end
