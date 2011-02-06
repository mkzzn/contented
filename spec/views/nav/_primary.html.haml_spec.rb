require 'spec_helper'

describe "/nav/_primary.html.haml" do

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

  def mock_category(stubs={})
    mock_model(Category).as_null_object.tap do |category|
      category.stub(stubs) unless stubs.empty?
    end
  end
end
