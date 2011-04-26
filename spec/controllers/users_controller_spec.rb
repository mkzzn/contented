require 'spec_helper'

describe UsersController do
  def mock_user(stubs={})
    (@mock_user ||= mock_model(User).as_null_object).tap do |user|
      user.stub(stubs) unless stubs.empty?
    end
  end

  context "GET 'new'" do
    it "should build a new user" do
      User.should_receive(:new) { mock_user :save => false }
      get "new"
    end
  end

  context "POST 'create'" do

    context "success" do
      before(:each) do
        @user_attrs = Factory.attributes_for(:user).inject({}) do |hash, pair|
          hash[pair[0].to_s] = pair[1]
          hash
        end
        @user = mock_user(@user_attrs)
      end

      it "should create a new user" do
        User.should_receive(:new).with(@user_attrs) { @user }
        post "create", :user => @user_attrs
      end

      it "should redirect to the articles path" do
        post "create", :user => @user_attrs
        response.code.should == "302"
        response.should redirect_to(confirm_users_path)
      end
    end

    context "failure" do
      before(:each) do
        @mock_user = mock_user({})
      end

      it "should create a new user" do
        User.should_receive(:new).with({}) { mock_user }
        post "create", :user => {}
      end

      it "should redirect to the articles path" do
        post "create", :user => {}
        response.should_not redirect_to(confirm_users_path)
        response.code.should == "200"
      end
    end
  end
end
