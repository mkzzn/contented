require 'spec_helper'

describe ArticlesHelper do
  include ActionView::Helpers
  include Haml::Helpers

  describe "comments_link" do
    before(:each) do
      @article = Factory :article
    end
    
    it "should return a link with the number of comments" do
      @article.stub_chain(:comments, :count) { 2 }
      extend ActionView::Helpers::TextHelper
      comments_link(@article).should == link_to("2 comments", (article_path(@article) + "#comments"))
    end
  end
end
