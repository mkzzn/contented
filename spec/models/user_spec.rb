require 'spec_helper'

describe User do
  describe "roles" do
    it "should have a list of valid roles" do
      User::ROLES.should == %w[ reader admin ]
    end
  end
end
