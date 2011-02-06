require 'spec_helper'

describe "articles/edit.html.haml" do
  before(:each) do
    assign :article, stub_model(Article)
  end

  it "should render the form" do
    render
    view.should render_template("_form", :count => 1)
  end
end
