require 'spec_helper'

describe ConfirmationsController do
  def mock_user(stubs={})
    (mock_model(User).as_null_object).tap do |user|
      user.stub(stubs) unless stubs.empty?
    end
  end


  describe "POST 'create'" do
    before(:each) do
      @user = mock_user :perishable_token => "waffles"
    end

    context "valid token provided" do
      it "should confirm the user and redirect to the homepage" do
        User.stub!(:find_using_perishable_token).with("waffles") { @user }
        @user.should_receive(:confirm!) { true }
        post 'create', :confirmation => "waffles"
        response.should redirect_to(root_path)
      end
    end

    context "invalid token provided" do
      it "should render the confirmation template again" do
        User.stub!(:find_using_perishable_token).with("belgians") { nil }
        post 'create', :confirmation => "belgians"
        response.should render_template("new")
      end
    end
  end
end
