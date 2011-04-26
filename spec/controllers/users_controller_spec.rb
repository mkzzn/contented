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
end
