require 'spec_helper'
require "cancan/matchers"

describe User do
  describe "reader" do
    before(:each) do
      @user = Factory :user, :role => "reader"
      @ability = Ability.new(@user)
    end

    it "should be able to manage its own account" do
      @ability.should be_able_to(:manage, @user)
    end

    it "should not be able ot manage other users" do
      user2 = Factory :user
      @ability.should_not be_able_to(:manage, user2)
    end
  end

  describe "admin" do
    it "should be able to manage any user" do
      admin = Factory :user, :role => "admin"
      user1 = Factory :user, :role => "reader"
      user2 = Factory :user, :role => "admin"
      ability = Ability.new(admin)
      ability.should be_able_to(:manage, user1)
      ability.should be_able_to(:manage, user2)
    end
  end
end
