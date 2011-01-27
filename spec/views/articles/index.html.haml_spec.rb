require 'spec_helper'

describe "articles/index.html.haml" do
  it "should render the article partial for each article" do
    assign(:articles, [stub_model(Article), stub_model(Article)])
    render
    view.should render_template(:partial => "_article", :count => 2)
  end
end
