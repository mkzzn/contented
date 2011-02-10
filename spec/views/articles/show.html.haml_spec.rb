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

  before(:each) do
    @article_stubs = {
      :category => stub_model(Category),
      :categorized? => true,
      :category_name => "ultracat"
    }
  end

  it "should render a partial for each comment" do
    @article = mock_model(Article, @article_stubs)
    expect_and_render_resources
    view.should render_template(:partial => "comments/_comment", :count => 2)
    rendered.should =~ /ultracat/
  end

  context "category link" do
    it "should not render one if the article is uncategorized" do
      @article = mock_model Article, @article_stubs.merge(:categorized? => false)
      expect_and_render_resources
      view.should render_template(:partial => "comments/_comment", :count => 2)
      rendered.should_not =~ /ultracat/
      rendered.should =~ /Uncategorized/
    end

    it "should render one if the article is categorized" do
      @article = mock_model Article, @article_stubs
      expect_and_render_resources
      view.should render_template(:partial => "comments/_comment", :count => 2)
      rendered.should =~ /ultracat/
      rendered.should_not =~ /Uncategorized/
    end
  end
end
