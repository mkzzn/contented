require 'spec_helper'

describe "articles/show.html.haml" do
  def expect_and_render_resources
    @article.should_receive(:title)
    @article.should_receive(:body)
    
    @comment = mock_model(Comment)
    @comment.should_receive(:body)
    
    assign :comments, [stub_model(Comment), stub_model(Comment)]
    assign :article, @article
    assign :comment, @comment
    render
  end

  # before(:each) do
  #   @article_stubs = {
  #     :category => stub_model(Category),
  #     :categorized? => true,
  #     :category_name => "ultracat"
  #   }
  # end

  # it "should render a partial for each comment" do
  #   @article = mock_model(Article, @article_stubs)
  #   expect_and_render_resources
  #   view.should render_template(:partial => "comments/_comment", :count => 2)
  #   rendered.should =~ /ultracat/
  # end

  # describe "delete link" do
  #   before(:each) do
  #     stub_current_ability
  #     @article = mock_model(Article, @article_stubs)
  #   end

  #   context "user can delete article" do
  #     it "should render a link to destroy the article" do
  #       @ability.can :destroy, @article
  #       expect_and_render_resources
  #       rendered.should have_selector(".article input.destroy")
  #     end
  #   end
    
  #   context "user cannot delete article" do
  #     it "should not render a link to destroy the article" do
  #       @ability.cannot :destroy, @article
  #       expect_and_render_resources
  #       rendered.should_not have_selector(".article input.destroy")
  #     end
  #   end
  # end

  before(:each) do
    @article = stub_article
    assign :article, @article
    assign :comments, [ stub_comment, stub_comment ] 
    assign :comment, stub_comment
  end

  describe "edit link" do
    before(:each) do
      stub_current_ability
    end

    context "user can edit article" do
      it "should render a link to edit the article" do
        @ability.can :edit, Article
        render
        rendered.should have_selector(".article .resource_links a.edit")
      end
    end
    
    context "user cannot edit article" do
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
        rendered.should include("Uncategorized")
      end
    end

    context "article is categorized" do
      it "should render the category link" do
        @category = mock_category :id => 10, :title => "Snake Bait"
        @article.stub!(:category) { @category }
        render
        rendered.should include("Snake Bait")
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
