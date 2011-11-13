require 'spec_helper'

describe CommentsController do
  def mock_article(stubs={})
    (@mock_article ||= mock_model(Article).as_null_object).tap do |article|
      article.stub(stubs) unless stubs.empty?
    end
  end

  def mock_comment(stubs={})
    (@mock_comment ||= mock_model(Comment).as_null_object).tap do |comment|
      comment.stub(stubs) unless stubs.empty?
    end
  end

  context "POST 'create'" do
    before(:each) do
      @article = Factory :article, :id => "3"
      Article.should_receive(:find).with("3") { @article }
      @params = {"article_id" => "3", "comment" => {"body" => "kwl!"}}
      @comment = mock_comment :body => "kwl!"
      @article.stub_chain(:comments, :create) { @comment }
    end

    it "should redirect to the article on success" do
      @comment.stub!(:valid?) { true }
      post 'create', @params
      response.should redirect_to(@article)
    end

    it "should render the view article action on failure" do
      @comment.stub!(:valid?) { false }
      @article.stub_chain(:comments, :reject)
      post 'create', @params
      response.should render_template("show")
    end
  end

  context "DELETE 'destroy'" do
    before(:each) do
      # Setup
      @article = mock_article :id => 2
      @comment = mock_comment(:article_id => @article.id, :body => "doug")

      # Expectation
      Comment.should_receive(:find).with(1) { @comment }
      @comment.should_receive(:article) { @article }
    end
      
    context "comment is destroyed" do
      it "should create a notice and redirect to the article" do
        @comment.should_receive(:body) { "doug" }
        @comment.stub!(:destroy) { true }
        delete 'destroy', :id => 1
        response.should redirect_to(@article)
      end
    end

    context "comment is not destroyed" do
      it "should just redirect to the article" do
        @comment.stub!(:destroy) { false }
        delete 'destroy', :id => 1
        response.should redirect_to(@article)
      end
    end
  end
end
