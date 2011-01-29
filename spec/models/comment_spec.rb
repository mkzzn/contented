require 'spec_helper'

describe Comment do
  context "associations" do
    before(:each) do
      @article = Factory :article
      @comment = Factory :comment, :article => @article
    end
    
    it "should belong to an article" do
      @comment.article.should == @article
    end
  end
end
