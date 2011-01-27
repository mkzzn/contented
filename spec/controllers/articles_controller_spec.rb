require 'spec_helper'

describe ArticlesController do
  before(:each) do
    @attributes = {"title" => "excellent", "body" => "nonsense"}
  end
  
  describe "GET index" do
    it "should return available articles" do
      article = mock_model(Article, @attributes)
      articles = Article.should_receive(:all).and_return [article]
      get 'index'
    end
  end

  describe "DELETE destroy" do
    it "should destroy an article" do
      article = mock_model Article
      article.stub!(:id).and_return 2
      Article.should_receive(:delete).with(article.id).and_return article
      delete 'destroy', :id => article.id
    end
  end
  
  describe "GET show" do
    it "should return the relevant article" do
      article = mock_model Article
      article.stub!(:id).and_return 2
      Article.should_receive(:find).with(article.id).and_return article
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

  describe "POST 'create'" do
    it "should create a new article" do
      article = Factory(:article, @attributes)
      Article.should_receive(:create).with(@attributes).and_return article
      post :create, :article => @attributes
    end
  end

end
