require 'spec_helper'

describe ArticlesController do
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

  before(:each) do
    @attributes = {"title" => "excellent", "body" => "nonsense"}
  end
  
  describe "GET 'index'" do
    it "should return available articles" do
      Article.should_receive(:all) { mock_article @attributes }
      get 'index'
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @article = mock_article
      @article.stub!(:id) { 2 }
    end

    it "should destroy an article" do
      Article.should_receive(:delete).with(@article.id) { @article }
      delete 'destroy', :id => @article.id
    end
    
    it "should redirect to the articles index" do
      delete 'destroy', :id => @article.id
      response.code.should == "302"
      response.should redirect_to(articles_path)
    end
  end
  
  describe "GET 'show'" do
    it "should return the relevant article and build a new comment" do
      # Setup
      article = mock_article
      article.stub!(:id) { 2 }
      new_comment = mock_comment :save => false
      comments = [ mock_comment(:article_id => 2) ]

      # Expectations
      Article.should_receive(:find).with(article.id) { article }
      Comment.should_receive(:new).with({:article_id => 2}) { new_comment }
      article.should_receive(:comments) { comments }

      # Call
      get 'show', :id => article.id
    end
  end

  describe "GET 'new'" do
    it "should build a new article" do
      Article.should_receive(:new) { mock_article :save => false }
      get 'new'
    end
  end
  
  describe "GET 'edit'" do
    it "should get the article" do
      article = mock_article
      article.stub!(:id) { 2 }
      Article.should_receive(:find).with(2) { article }
      get 'edit', :id => article.id
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @article = mock_article
      @article.stub!(:id) { 2 }
      @attrs = { "body" => "bar", "title" => "foo" }
      Article.should_receive(:find).with(2) { @article }
      @article.should_receive(:update_attributes).with(@attrs) { true }
    end

    context "success" do
      it "should redirect to show article page" do
        @article.stub!(:valid?) { true }
        put 'update', :id => 2, :article => @attrs      
        response.should redirect_to(article_path(@article))
      end
    end

    context "failure" do
      it "should render the new article template" do
        @article.stub!(:valid?) { false }
        put 'update', :id => 2, :article => @attrs      
        response.should render_template("new")
      end
    end
  end
  
  describe "POST 'create'" do
    context "success" do
      before(:each) do
        @article = mock_article @attributes
      end
      
      it "should create a new article" do
        Article.should_receive(:create).with(@attributes) { @article }
        post :create, :article => @attributes
      end
      
      it "should redirect to the articles path" do
        post :create, :article => @attributes
        response.code.should == "302"
        response.should redirect_to(articles_path)
      end
    end

    context "failure" do
      before(:each) do
        @article = mock_article :title => ""
      end

      it "should create a new article" do
        Article.should_receive(:create).with({}) { @article }
        post :create, :article => {}
      end

      it "should not redirect" do
        post :create, :article => {}
        response.should_not redirect_to(articles_path)
        response.code.should == "200"
      end
    end
  end
end
