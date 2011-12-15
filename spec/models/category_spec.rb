require 'spec_helper'

describe Category do
  context "validations" do
    context "pass" do
      it "should validate a legit title" do
        @category = Factory.build :category, :title => "walruses"
        @category.save
        @category.should be_valid
      end
    end

    context "fail" do
      it "should not validate a nil title" do
        @category = Factory.build :category, :title => nil
      end

      it "should not validate an empty title" do
        @category = Factory.build :category, :title => ""
      end
      
      after(:each) do
        @category.save
        @category.should_not be_valid
      end
    end
  end

  context "associations" do
    context "articles" do
      it "should be able to have many articles" do
        category = Factory :category
        2.times { Factory :article, :category => category }
        category.articles.size.should == 2
      end
    end
  end

  describe "slugs" do
    before(:each) do
      Category.destroy_all
      @category = Factory :category, :title => "The Great Hog Race"
    end

    it "should use a parameterized version of the title" do
      @category.to_param.should == "the-great-hog-race"
    end

    it "should add a tag to identical slugs" do
      @category2 = Factory :category, :title => "The Great Hog Race"
      @category2.to_param.should == "the-great-hog-race--2"
    end
  end

  context "recent article filter" do
    it "should only display recent articles" do
      category = Factory :category
      3.times { Factory :article, :category => category }
      old_article = Factory :article, :category => category, :created_at => 3.years.ago
      category.recent_articles.should_not include(old_article)
    end

    it "should return no more than three articles" do
      category = Factory :category
      4.times { Factory :article, :category => category }
      category.recent_articles.size.should == 3
    end
  end
  
  context "callbacks" do
    context "after destroy" do
      it "should uncategorize all associated articles" do
        category = Factory :category
        article = Factory :article, :category => category
        article[:category_id].should == category[:id]
        category.destroy
        Article.where(:id => article[:id], :category_id => category[:id]).should be_empty
      end
    end
  end
end
