require 'spec_helper'

describe User do
  describe "confirmation" do
    before(:each) do
      @user = Factory :user, :confirmed => false
      @user.update_attributes :perishable_token => "badgers"
    end

    context "for unconfirmed user" do
      it "should confirm the user" do
        @user.confirm!.should == true
        @user.confirmed.should == true
      end
    end

    context "for confirmed user" do
      it "should raise an error" do
        @user = Factory :user, :confirmed => true
        lambda { @user.confirm! }.should raise_error ("user is already confirmed")
        @user.confirmed.should == true
      end
    end
  end
end
