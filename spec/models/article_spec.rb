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
    context "comments" do
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

    context "categories" do
      before(:each) do
        @category = Factory :category
        @article = Factory :article, :category => @category
      end
      
      it "should be able to belong to a category" do
        @article.category.should == @category
      end

      context "uncategorized" do
        it "should be uncategorized if it has no category" do
          article = Factory :article
          article.uncategorized?.should == true
        end

        it "should not be uncategorized if it has a category" do
          @article.uncategorized?.should == false
        end
      end
      
      context "category name" do
        it "should return the category name if it has a category" do
          @article.category_name.should == @category[:title]
        end
        
        it "should return 'Uncategorized' if it has no category" do
          article = Factory :article
          article.category_name.should == "Uncategorized"
        end
      end
    end
  end
end
