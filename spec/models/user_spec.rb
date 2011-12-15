require 'spec_helper'

describe User do
  describe "roles" do
    it "should have a list of valid roles" do
      User::ROLES.should == %w[ reader admin ]
    end
  end

  describe "slugs" do
    before(:each) do
      User.destroy_all
      @user = Factory :user, :first_name => "Dave", :last_name => "Henderson"
    end

    it "should use a parameterized version of the title" do
      @user.to_param.should == "dave-henderson"
    end

    it "should add a tag to identical slugs" do
      @user2 = Factory :user, :first_name => "Dave", :last_name => "Henderson"
      @user2.to_param.should == "dave-henderson--2"
    end
  end

  describe "full_name" do
    it "should combine the first and last names" do
      user = Factory :user, :first_name => "Steve", :last_name => "Barker"
      user.full_name.should == "Steve Barker"
    end
  end
end
