require 'spec_helper'

describe CommentsController do
  context "POST 'create'" do
    before(:each) do
      @comment_hash = { "body" => "kwl!" }
      @params = { "article_id" => "3", "comment" => @comment_hash }
      article = mock_model(Article, :id => 3)
      comment = mock_model(Comment, :body => "kwl!")

    end

    it "should find the parent article" do
      Article.should_receive(:find).with("3").and_return article
    end

    it "should redirect to the article on success" do
    end

    it "should render the view article action on failure" do
      
    end

    it "should find the parent article" do
      article.should_receive(:create_comment).with(@comment_hash).and_return comment
      post 'create', @params
      response.should render_nothing
    end
  end
end
