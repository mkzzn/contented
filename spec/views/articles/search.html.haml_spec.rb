require 'spec_helper'

describe "articles/search.html.haml" do
  before(:each) do
    assign(:articles, [stub_model(Article), stub_model(Article)])
  end

  it "should render the article partial for each article" do
    render
    view.should render_template(:partial => "_article", :count => 2)
  end

  it "should say how many articles were found" do
    render
    rendered.should include("Found 2 articles with keyword")
  end
end
