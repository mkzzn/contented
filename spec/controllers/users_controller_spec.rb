require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    context "admin user" do
      it "should render the index" do
        controller.stub!(:current_user) { Factory :user, :role => "admin" }
        get :index
        response.should render_template("index")
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
