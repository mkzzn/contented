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
end
