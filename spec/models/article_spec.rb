require 'spec_helper'

describe Article do
  context "validations" do
    context "attributes" do
      before(:each) do
        @article = Factory :article, :title => nil, :body => nil 
      end

      it "should validate presence of title" do
        @article.should be_valid
      end

      it "should validate presence of body" do
        @article.should be_valid
      end
    end
  end
end
