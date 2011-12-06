require 'spec_helper'

describe User do
  describe "roles" do
    it "should have a list of valid roles" do
      User::ROLES.should == %w[ reader admin ]
    end
  end

  describe "full_name" do
    it "should combine the first and last names" do
      user = Factory :user, :first_name => "Steve", :last_name => "Barker"
      user.full_name.should == "Steve Barker"
    end
  end
end
