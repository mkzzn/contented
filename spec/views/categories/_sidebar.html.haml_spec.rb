require 'spec_helper'

describe "/categories/_sidebar.html.haml" do

  before(:each) do
    @categories = [ mock_category, mock_category ]
  end

  it "should get all categories" do
    Category.should_receive(:all) { @categories }
    render
  end

  it "should render the nav category partial for each category" do
    Category.stub!(:all) { @categories }
    render
    view.should render_template(:partial => "_category", :count => 2)
  end

  context "uncategorized link" do
    it "should have one if an uncategorized article exists" do
      Article.stub_chain(:uncategorized, :count) { 3 }
      render
      rendered.should include("<a href=\"/articles/uncategorized\" class=\"category\">Uncategorized (3)</a>")
    end

    it "should not have one if no uncategorized articles exists" do
      Article.stub_chain(:uncategorized, :count) { 0 }
      render
      rendered.should_not include("Uncategorized")
    end
  end

  def mock_category(stubs={})
    (@mock_category ||= mock_model(Category).as_null_object).tap do |category|
      category.stub(stubs) unless stubs.empty?
    end
  end
end
