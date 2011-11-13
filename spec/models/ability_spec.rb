require 'spec_helper'
require "cancan/matchers"

describe User do
  describe "reader" do
    before(:each) do
      @user = Factory :user, :role => "reader"
      @ability = Ability.new(@user)
    end

    describe "user abilities" do
      it "should be able to manage its own account" do
        @ability.should be_able_to(:manage, @user)
      end
      
      it "should not be able ot manage other users" do
        user2 = Factory :user
        @ability.should_not be_able_to(:manage, user2)
      end
    end

    describe "article abilities" do
      it "should not be able to manage articles" do
        @ability.should_not be_able_to(:manage, Article)
      end
    end

    describe "category abilities" do
      it "should not be able to manage categories" do
        @ability.should_not be_able_to(:manage, Category)
      end
    end
    
    describe "comment abilities" do
      it "should be able to create a comment" do
        @ability.should be_able_to(:create, Comment)
      end
    end
  end

  describe "admin" do
    before(:each) do
      @admin = Factory :user, :role => "admin"
      @ability = Ability.new @admin
    end

    describe "user abilities" do
      it "should be able to manage any user" do
        user1 = Factory :user, :role => "reader"
        user2 = Factory :user, :role => "admin"
        @ability.should be_able_to(:manage, user1)
        @ability.should be_able_to(:manage, user2)
      end
    end

    describe "article abilities" do
      it "should not be able to manage articles" do
        @ability.should be_able_to(:manage, Article)
      end
    end

    describe "category abilities" do
      it "should not be able to manage categories" do
        @ability.should be_able_to(:manage, Category)
      end
    end
  end
end
