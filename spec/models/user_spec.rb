require 'spec_helper'

describe User do
  describe "update_with_password" do
    before(:each) do
      @user = Factory :user
    end

    it "should filter out password params if both are blank" do
      attrs = { "first_name" => "Steve", "password" => "", "password_confirmation" => "" }
      @user.should_receive(:update_attributes).with({ "first_name" => "Steve" })
      @user.update_without_password attrs
    end

    it "should not filter out the password if one is not blank" do
      attrs = { "password" => "ralph", "password_confirmation" => "" }
      @user.should_receive(:update_attributes).with(attrs)
      @user.update_without_password attrs
    end

    it "should not filter out the password if one is not blank" do
      attrs = { "password" => "ralph", "password_confirmation" => "bollocks" }
      @user.should_receive(:update_attributes).with(attrs)
      @user.update_without_password attrs
    end
  end
end
