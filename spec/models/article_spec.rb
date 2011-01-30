require 'spec_helper'

describe Article do
  context "validations" do
    context "attributes" do
      before(:each) do
        @article = Factory.build :article, :title => nil, :body => nil 
        @article.save
      end

      it "should validate presence of title" do
        @article.should_not be_valid
      end

      it "should validate presence of body" do
        @article.should_not be_valid
      end
    end
  end

  context "associations" do
    before(:each) do
      @article = Factory :article
      @comment = Factory :comment, :article => @article
    end

    it "should have comments" do
      @article.comments.first.should == @comment
    end

    it "should destroy dependent comments on deletion" do
      @article.destroy
      Comment.count(@comment[:id]).should == 0
    end
  end
end
