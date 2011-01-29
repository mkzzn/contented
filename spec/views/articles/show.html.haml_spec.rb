require 'spec_helper'

describe "articles/show.html.haml" do
  it "should render a partial for each comment" do
    article = mock_model(Article)
    article.should_receive(:title)
    article.should_receive(:body)
    article.stub!(:comments).and_return [stub_model(Comment), stub_model(Comment)]
    assign(:article, article)
    render
    view.should render_template(:partial => "comments/_comment", :count => 2)
  end
end
