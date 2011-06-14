require 'spec_helper'

describe "articles/_form.html.haml" do
  before(:each) do
    assign :article, stub_model(Article)
  end

  it "should get all categories" do
    categories = [mock_category, mock_category]
    Category.should_receive(:all) { categories }
    render
  end

  def mock_category(stubs={})
    (@mock_category ||= mock_model(Category).as_null_object).tap do |category|
      category.stub(stubs) unless stubs.empty?
    end
  end
end
