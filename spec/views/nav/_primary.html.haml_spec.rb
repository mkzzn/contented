require 'spec_helper'

describe "/nav/_primary.html.haml" do
  it "should render the nav category partial for each category" do
    assign :categories, [stub_model(Category), stub_model(Category)]
    render
    view.should render_template(:partial => "_category", :count => 2)
  end
end
