require 'spec_helper'

describe "categories/index.html.haml" do
  before(:each) do
    @category = mock_category
    @articles = (1..2).map { mock_article }
    @category.stub!(:recent_articles) { @articles }
    assign :categories, (1..2).map { @category }
    render
  end

  it "should render the category partial for each category" do
    view.should render_template(:partial => "_category", :count => 2)
  end

  it "should render a partial for each category article" do
    view.should render_template(:partial => "articles/_article", :count => 4)
  end

  def mock_article(stubs={})
    (@mock_article ||= mock_model(Article).as_null_object).tap do |article|
      article.stub(stubs) unless stubs.empty?
    end
  end

  def mock_category(stubs={})
    (@mock_category ||= mock_model(Category).as_null_object).tap do |category|
      category.stub(stubs) unless stubs.empty?
    end
  end
end
