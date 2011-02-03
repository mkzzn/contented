require 'spec_helper'

describe "categories/index.html.haml" do
  it "should render the category partial for each category" do
    category = stub_model(Category)
    articles = [stub_model(Article), stub_model(Article)]
    category.stub!(:articles) { articles }
    assign :categories, [category, category]
    render
    view.should render_template(:partial => "_category", :count => 2)
    view.should render_template(:partial => "articles/_article", :count => 4)
  end
end
