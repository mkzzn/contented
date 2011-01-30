require 'spec_helper'

describe "articles/show.html.haml" do
  it "should render a partial for each comment" do
    article = mock_model(Article)
    article.should_receive(:title)
    article.should_receive(:body)

    comment = mock_model(Comment)
    comment.should_receive(:body)

    assign :comments, [stub_model(Comment), stub_model(Comment)]
    assign :article, article
    assign :comment, comment
    render
    view.should render_template(:partial => "comments/_comment", :count => 2)
  end
end
