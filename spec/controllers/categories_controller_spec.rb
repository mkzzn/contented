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

  context "GET new" do
    it "should build a new category" do
      Category.should_receive(:new).and_return mock_category(:save => false)
      get "new"
    end
  end
end
