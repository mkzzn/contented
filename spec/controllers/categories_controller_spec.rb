require 'spec_helper'

describe CategoriesController do

  def mock_category(stubs={})
    (@mock_category ||= mock_model(Category).as_null_object).tap do |category|
      category.stub(stubs) unless stubs.empty?
    end
  end

  def mock_article(stubs={})
    (@mock_article ||= mock_model(Article).as_null_object).tap do |article|
      article.stub(stubs) unless stubs.empty?
    end
  end

  context "GET index" do
    it "should get all existing categories" do
      categories = (1..2).collect { mock_category }
      Category.should_receive(:all) { categories }
      get "index"
    end
  end

  context "GET edit" do
    it "should get the target category" do
      Category.should_receive(:find).with(2) { mock_category :id => 2 }
      get "edit", :id => 2
    end
  end
  
  context "GET new" do
    it "should build a new category" do
      Category.should_receive(:new) { mock_category(:save => false) }
      get "new"
    end
  end

  context "POST create" do
    before(:each) do
      @params = {"description" => "douglass", "title" => "fredrick"}
      @category = mock_category(@params)
      Category.should_receive(:create).with(@params) { @category }
    end
    
    it "should redirect to the categories index on success" do
      @category.stub!(:valid?) { true }
      post "create", :category => @params
      response.should redirect_to(categories_path)
    end

    it "should render the new action on failure" do
      @category.stub!(:valid?) { false }
      post "create", :category => @params
      response.should render_template("new")
    end
  end
end
