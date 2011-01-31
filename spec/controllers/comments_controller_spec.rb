require 'spec_helper'

describe CommentsController do
  context "POST 'create'" do
    before(:each) do
      @article = Factory :article, :id => "3"
      Article.should_receive(:find).with("3").and_return @article
      @params = {"article_id" => "3", "comment" => {"body" => "kwl!"}}
      @comment = mock_model(Comment, :body => "kwl!")
      @article.stub_chain(:comments, :create).and_return @comment
    end

    it "should redirect to the article on success" do
      @comment.stub!(:valid?).and_return true
      post 'create', @params
      response.should redirect_to(@article)
    end

    it "should render the view article action on failure" do
      @comment.stub!(:valid?).and_return false
      @article.stub_chain(:comments, :reject)
      post 'create', @params
      response.should render_template("show")
    end
  end

  context "DELETE 'destroy'" do
    it "should destroy the comment" do
      # Setup
      article = mock_model(Article, :id => 2)
      comment = mock_model(Comment, :article_id => article.id)

      # Expectation
      Comment.should_receive(:find).with(1).and_return comment
      comment.should_receive(:article).and_return article
      comment.stub!(:destroy).and_return true

      # Request
      delete 'destroy', :id => 1

      # Response
      response.should redirect_to(article_path(article))
    end
  end
end
