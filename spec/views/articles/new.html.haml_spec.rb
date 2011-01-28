require 'spec_helper'

describe "articles/new.html.haml" do
  it "should render the form" do
    assign :article, stub_model(Article)
    render
    view.should render_template("_form", :count => 1)
  end
end
