require 'spec_helper'

describe Comment do
  context "validations" do
    it "cannot have a nil body" do
      @comment = Factory.build :comment, :body => nil
      @comment.should_not be_valid
    end

    it "cannot have an empty body" do
      @comment = Factory.build :comment, :body => ""
      @comment.should_not be_valid
    end
    
    it "must have an article" do
      @comment = Factory.build :comment, :article_id => nil
      @comment.should_not be_valid
    end
  end

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
