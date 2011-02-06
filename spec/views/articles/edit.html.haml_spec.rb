require 'spec_helper'

describe "articles/edit.html.haml" do
  before(:each) do
    assign :article, stub_model(Article)
  end

  it "should get all categories" do
    categories = [mock_category, mock_category]
    Category.should_receive(:all) { categories }
    render
  end

  it "should render the form" do
    render
    view.should render_template("_form", :count => 1)
  end

  def mock_category(stubs={})
    mock_model(Category).as_null_object.tap do |category|
      category.stub(stubs) unless stubs.empty?
    end
  end
end
