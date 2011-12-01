require 'spec_helper'

describe Article do
  describe "validations" do
    describe "attributes" do
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

    describe "attachments" do
      before(:each) do
        @article = Factory :article
        @article.stub! :assets => []
      end

      describe "max attachments" do
        it "should validate with fewer than 25 attachments" do
          @article.stub_chain(:assets, :length) { 8 }
          @article.valid?
          @article.should be_valid
        end

        it "should not validate with more than 25  attachments" do
          @article.stub_chain(:assets, :length) { 40 }
          @article.valid?
          @article.should_not be_valid
        end
      end

      describe "max file size" do
        it "should validate with assets under one megabyte" do
          asset = Factory :asset, :data_file_size => 100_000
          @article.stub! :assets => [ asset ]
          @article.valid?.should be_true
        end

        it "should not validate with assets above one megabyte" do
          asset = Factory :asset, :data_file_size => 3_000_000
          @article.stub! :assets => [ asset ]
          @article.valid?.should be_false
          @article.errors.count.should == 1
        end
      end
    end
  end

  describe "scopes" do
    describe "uncategorized" do
      it "should be able to filter categorized articles" do
        article1 = Factory :categorized_article
        article2 = Factory :categorized_article, :category => nil
        Article.uncategorized.should == [ article2 ]
      end
    end
  end

  describe "associations" do
    describe "comments" do
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

    describe "categories" do
      it "should be able to belong to a category" do
        @category = Factory :category
        @article = Factory :article, :category => @category
        @article.category.should == @category
      end

      describe "uncategorized" do
        it "should not be categorized if it has no category" do
          Factory(:article).categorized?.should == false
        end

        it "should not be uncategorized if it has a category" do
          article = Factory :categorized_article
          article.categorized?.should == true
        end
      end
      
      describe "category name" do
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
end
