require 'spec_helper'

describe Category do
  context "validations" do
    context "attributes" do
      before(:each) do
        @category = Factory.build :category, :title => nil, :body => nil 
        @category.save
      end

      it "should validate presence of title" do
        @article.should_not be_valid
      end
    end
  end
end
