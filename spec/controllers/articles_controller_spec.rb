require 'spec_helper'

describe ArticlesController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'view'" do
    it "should be successful" do
      get 'view'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should build a new article" do
      article = mock_model(Article, :save => false)
      Article.should_receive(:new).and_return article
      get 'new'
    end
  end

end
