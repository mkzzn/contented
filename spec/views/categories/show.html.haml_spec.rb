require 'spec_helper'

describe "categories/show.html.haml" do
  before(:each) do
    @articles = [ stub_article, stub_article ]
    @category = stub_category
    @category.stub!(:articles) { @articles }
    assign :category, @category
    stub_current_ability
  end

  it "should render a partial for every associated article" do
    render
    view.should render_template(:partial => "articles/_article", :count => 2)
  end

  describe "edit category link" do
    context "user is authorized" do
      before(:each) do
        @ability.can :edit, Category
      end

      it "should render an 'edit' link" do
        render
        rendered.should have_selector("#category_#{@category.id} a.edit")
      end
    end

    context "user is not authorized" do
      before(:each) do
        @ability.cannot :edit, Category
      end

      it "should not render an 'edit' link" do
        render
        rendered.should_not have_selector("#category_#{@category.id} a.edit")
      end
    end
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

  def stub_current_ability
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub!(:current_ability) { @ability }
  end
end
