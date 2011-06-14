require 'spec_helper'

describe ParamFilter do
  describe "filter_empty_passwords" do
    it "should filter out passwords if both are blank" do
      attrs = { "first_name" => "Steve", "password" => "", "password_confirmation" => "" }
      ParamFilter.new(attrs).filter_empty_passwords.should == { "first_name" => "Steve" }
    end
    
    context "at least one password present" do
      it "should not filter out passwords if one is populated" do
        @attrs = { "password" => "ralph", "password_confirmation" => "" }
      end

      it "should not filter out passwords if both are populated" do
        @attrs = { "password" => "ralph", "password_confirmation" => "bollocks" }
      end

      after(:each) do
        ParamFilter.new(@attrs).filter_empty_passwords.should == @attrs
      end
    end
  end
end
