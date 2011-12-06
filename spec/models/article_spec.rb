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

  context "scopes" do
    context "uncategorized" do
      it "should be able to filter categorized articles" do
        article1 = Factory :categorized_article
        article2 = Factory :categorized_article, :category => nil
        Article.uncategorized.should == [ article2 ]
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
      it "should be able to belong to a category" do
        @category = Factory :category
        @article = Factory :article, :category => @category
        @article.category.should == @category
      end

      context "uncategorized" do
        it "should not be categorized if it has no category" do
          Factory(:article).categorized?.should == false
        end

        it "should not be uncategorized if it has a category" do
          article = Factory :categorized_article
          article.categorized?.should == true
        end
      end
      
      context "category name" do
        it "should return the category name if it has a category" do
          category = Factory :category
          article = Factory :article, :category => category
          article.category_name.should == category[:title]
        end
        
        it "should return 'Uncategorized' if it has no category" do
          article = Factory :article
          article.category_name.should == "Uncategorized"
        end
      end
    end
  end

  describe "created_date" do
    context "article has a created_at timestamp" do
      it "should return a formatted YYYY-MM-DD timestamp" do
        article = Factory :article, :created_at => Date.parse("2011-10-02")
        article.created_date.should == "2011-10-02"
      end
    end

    context "article has not been created" do
      it "should be nil" do
        Factory.build(:article).created_at.should be_nil
      end
    end
  end
end
