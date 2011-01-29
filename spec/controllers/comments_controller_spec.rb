require 'spec_helper'

describe CommentsController do
  context "POST 'create'" do
    it "should find the parent article" do
      article = mock_model(Article, :id => 3)
      comment = mock_model(Comment, :body => "kwl!")
      Article.should_receive(3).and_return article
      article.should_receive(:articles).should_receive(:build).and_return comment
      post 'create', "article" => {"id" => 3, "comment" => {"body" => "kwl!"}}
    end
  end
end
