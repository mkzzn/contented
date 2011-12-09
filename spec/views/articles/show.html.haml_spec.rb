require 'spec_helper'

describe "articles/show.html.haml" do
  before(:each) do
    @article = stub_article :body_markdown => "snakes"
    assign :article, @article
    assign :comments, (1..2).map { stub_comment }
    assign :comment, stub_comment
  end

  describe "comments partial" do
    it "should render a partial for each comment" do
      render
      view.should render_template(:partial => "comments/_comment", :count => 2)
    end
  end

  describe "delete link" do
    before(:each) do
      stub_current_ability
      @article = stub_article
    end

    context "user is authorized to delete article" do
      it "should render a link to destroy the article" do
        @ability.can :destroy, @article
        render
        rendered.should have_selector(".article input.destroy")
      end
    end
    
    context "user is not authorized to delete article" do
      it "should not render a link to destroy the article" do
        @ability.cannot :destroy, @article
        render
        rendered.should_not have_selector(".article input.destroy")
      end
    end
  end

  describe "edit link" do
    before(:each) do
      stub_current_ability
    end

    context "user is authorized to edit article" do
      it "should render a link to edit the article" do
        @ability.can :edit, Article
        render
        rendered.should have_selector(".article .resource_links a.edit")
      end
    end
    
    context "user isnot authorized to edit article" do
      it "should not render a link to edit the article" do
        @ability.cannot :edit, Article
        render
        rendered.should_not have_selector(".article .resource_links a.edit")
      end
    end
  end

  describe "category link" do
    context "article is not categorized" do
      it "should not render the category link" do
        @article.stub!(:categorized?) { false }
        render
        rendered.should include('<a href="/articles/uncategorized">Uncategorized</a>')
      end
    end

    context "article is categorized" do
      it "should render the category link" do
        @category = mock_category :id => 10, :title => "Snake Bait"
        @article.stub!(:category) { @category }
        render
        rendered.should include('<a href="/categories/10">Snake Bait</a>')
      end
    end
  end

  def mock_category(stubs={})
    (@mock_category ||= mock_model(Category).as_null_object).tap do |category|
      category.stub(stubs) unless stubs.empty?
    end
  end
  
  def stub_article(stubs={})
    (@stub_article ||= stub_model(Article).as_null_object).tap do |article|
      article.stub(stubs) unless stubs.empty?
    end
  end

  def stub_comment(stubs={})
    (@stub_comment ||= stub_model(Comment).as_null_object).tap do |comment|
      comment.stub(stubs) unless stubs.empty?
    end
  end

  def stub_current_ability
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub!(:current_ability) { @ability }
  end
end
