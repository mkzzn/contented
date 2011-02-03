require 'spec_helper'

describe "categories/index.html.haml" do
  it "should render the category partial for each category" do
    assign(:categories, [stub_model(Category), stub_model(Category)])
    render
    view.should render_template(:partial => "_category", :count => 2)
  end
end
