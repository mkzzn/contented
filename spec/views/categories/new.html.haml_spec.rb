require 'spec_helper'

describe "categories/new.html.haml" do
  it "should render the form" do
    assign :category, stub_model(Category)
    render
    view.should render_template("_form", :count => 1)
  end
end
