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
end
