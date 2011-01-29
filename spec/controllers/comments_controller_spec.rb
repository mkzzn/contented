require 'spec_helper'

def create_params(comments_hash)
  { "article_id" => "3" }.merge comments_hash
end

def create_setup(comment_body)
  @comments_hash = {"comment" => {"body" => comment_body}}
  @comment = mock_model(Comment, :body => comment_body)
  @article.should_receive(:create_comment).with(@comments_hash["comment"]).and_return @comment
end

describe CommentsController do
  context "POST 'create'" do
    before(:each) do
      @article = mock_model(Article, :id => "3")
      Article.should_receive(:find).with("3").and_return @article
    end

    it "should redirect to the article on success" do
      create_setup("kwl!")
      @comment.stub!(:valid?).and_return true
      post 'create', create_params(@comments_hash)
      response.should redirect_to(@article)
    end

    it "should render the view article action on failure" do
      create_setup("")
      @comment.stub!(:valid?).and_return false
      post 'create', create_params(@comments_hash)
      response.should render_template("show")
    end
  end
end
