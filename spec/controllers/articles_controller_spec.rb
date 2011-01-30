require 'spec_helper'

describe ArticlesController do
  before(:each) do
    @attributes = {"title" => "excellent", "body" => "nonsense"}
  end
  
  describe "GET 'index'" do
    it "should return available articles" do
      article = mock_model(Article, @attributes)
      articles = Article.should_receive(:all).and_return [article]
      get 'index'
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @article = mock_model Article
      @article.stub!(:id).and_return 2
    end

    it "should destroy an article" do
      Article.should_receive(:delete).with(@article.id).and_return @article
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
      article = mock_model Article
      comment = mock_model Comment, :save => false
      article.stub!(:id).and_return 2
      Article.should_receive(:find).with(article.id).and_return article
      article.should_receive(:build_comment).and_return comment
      get 'show', :id => article.id
    end
  end

  describe "GET 'new'" do
    it "should build a new article" do
      article = mock_model(Article, :save => false)
      Article.should_receive(:new).and_return article
      get 'new'
    end
  end
  
  describe "GET 'edit'" do
    it "should get the article" do
      article = mock_model Article
      article.stub!(:id).and_return 2
      Article.should_receive(:find).with(2).and_return article
      get 'edit', :id => article.id
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @article = mock_model Article
      @article.stub!(:id).and_return 2
      @attrs = { "body" => "bar", "title" => "foo" }
      Article.should_receive(:find).with(2).and_return @article
      @article.should_receive(:update_attributes).with(@attrs).and_return true
    end

    context "success" do
      it "should redirect to show article page" do
        @article.stub!(:valid?).and_return true
        put 'update', :id => 2, :article => @attrs      
        response.should redirect_to(article_path(@article))
      end
    end

    context "failure" do
      it "should render the new article template" do
        @article.stub!(:valid?).and_return false
        put 'update', :id => 2, :article => @attrs      
        response.should render_template("new")
      end
    end
  end
  
  describe "POST 'create'" do
    context "success" do
      before(:each) do
        @article = mock_model(Article, @attributes)
      end
      
      it "should create a new article" do
        Article.should_receive(:create).with(@attributes).and_return @article
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
        @article = mock_model(Article, :title => "")
      end

      it "should create a new article" do
        Article.should_receive(:create).with({}).and_return @article
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
