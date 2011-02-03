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
    context "has many" do
      context "articles" do
        it "should be able to have many articles" do
          category = Factory :category
          2.times { Factory :article, :category => category }
          category.articles.size.should == 2
        end
      end
    end
  end
end
