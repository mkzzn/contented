require 'spec_helper'

describe "categories/index.html.haml" do
  before(:each) do
    @category = stub_category
    @articles = (1..2).map { stub_article }
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

  def stub_article(stubs={})
    (@stub_article ||= stub_model(Article).as_null_object).tap do |article|
      article.stub(stubs) unless stubs.empty?
    end
  end

  def stub_category(stubs={})
    (@stub_category ||= stub_model(Category).as_null_object).tap do |category|
      category.stub(stubs) unless stubs.empty?
    end
  end
end
