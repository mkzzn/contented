require 'spec_helper'

describe ConfirmationsController do
  def mock_user(stubs={})
    (@mock_user ||= mock_model(User).as_null_object).tap do |user|
      user.stub(stubs) unless stubs.empty?
    end
  end


  describe "POST 'create'" do
    before(:each) do
      @user = mock_user(:perishable_token => "waffles")
      User.should_receive(:find_using_perishable_token).with(["waffles", 1.week]) { @user }
    end
    
    context "confirmation creates successfully" do
      @user.stub!(:activate!) { true }
      post 'create', :perishable_token => "waffles"
      response.should redirect
    end

    context "confirmation fails to create" do
      @user.stub!(:activate!) { false }
      post 'create', :perishable_token => "waffles"
      response.should render_template("new")
    end
  end
end
