require 'spec_helper'

describe "categories/show.html.haml" do
  before(:each) do
    articles = [stub_model(Article), stub_model(Article)]
    assign :category, stub_model(Category, :articles => articles)
    render
  end

  it "should render a partial for every associated article" do
    view.should render_template(:partial => "articles/_article", :count => 2)
  end
end
