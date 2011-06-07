require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    context "admin user" do
      before(:each) do
        controller.stub!(:current_user) { Factory :user, :role => "admin" }
      end
      
      it "should render the index" do
        get :index
        response.should render_template("index")
      end

      it "should get all users" do
        users = (1..2).collect { Factory :user }
        User.should_receive(:all) { users }
        get :index
      end
    end

    context "reader user" do
      it "should redirect to the homepage" do
        controller.stub!(:current_user) { Factory :user, :role => "reader" }
        get :index
        response.should redirect_to("/")
      end
    end
  end
end
