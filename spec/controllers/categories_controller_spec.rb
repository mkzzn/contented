require 'spec_helper'

describe CategoriesController do
  context "GET index" do
    it "should get all existing categories" do
      Category.should_receive(:all) { [mock_category, mock_category] }
      get "index"
    end
  end

  context "GET edit" do
    before(:each) do
      @category = mock_category(:id => 2)
    end

    it "should fetch the target category" do
      Category.should_receive(:find).with(2) { @category }
    end

    after(:each) do
      get "edit", :id => 2
    end
  end

  context "DELETE destroy" do
    it "should destroy the target category" do
      category = mock_category :id => 2
      Category.should_receive(:find).with(2) { category }
      category.should_receive(:destroy) { category }
      delete "destroy", :id => 2
    end
  end

  context "PUT update" do
    before(:each) do
      @params = { "description" => "herman", "title" => "craig" }
      @category = mock_category(:id => 2)
      Category.should_receive(:find).with(2) { @category }
    end

    context "success" do
      it "should update and redirect to the categories index" do
        @category.stub!(:update_attributes) { true }
        put "update", :id => 2, :category => @params
        response.should redirect_to(categories_path)
      end
    end

    context "failure" do
      it "should fail to update and render the form template" do
        @category.stub!(:update_attributes) { false }
        put "update", :id => 2, :category => @params
        response.should render_template("new")
      end
    end
  end

  context "GET new" do
    it "should build a new category" do
      Category.should_receive(:new) { mock_category(:save => false) }
    end

    after(:each) do
      get "new"
    end
  end

  context "GET show" do
    before(:each) do
      @category = mock_category(:id => 2)
    end

    it "should fetch the target category" do
      Category.should_receive(:find).with(2) { @category }
    end

    after(:each) do
      get "show", :id => 2
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
end
