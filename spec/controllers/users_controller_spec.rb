require 'spec_helper'

describe UsersController do
  def mock_user(stubs={})
    mock_model(User).as_null_object.tap do |user|
      user.stub(stubs) unless stubs.empty?
    end
  end

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

  describe "GET 'edit'" do
    it "should fetch the target user" do
      User.should_receive(:find).with(3)
      get 'edit', :id => 3
    end
  end

  describe "PUT 'update'" do
    it "should fetch the target user" do
      User.should_receive(:find).with(3) { mock_user }
      post 'update', :id => 3
    end

    it "should update the attributes of the user in question" do
      user_attrs = { "first_name" => "Walter", "last_name" => "Hagel" }
      user = mock_user
      User.stub!(:find) { user }
      user.should_receive(:update_without_password).with(user_attrs)
      post 'update', :id => 3, :user => user_attrs
    end

    context "user is invalid after update" do
      before(:each) do
        @user = mock_user
        User.stub!(:find) { @user }
        @user.stub!(:update_without_password) { false }
        put 'update', :id => 3
      end
      
      it "should render the edit template with errors" do
        response.should render_template("users/edit")
      end
    end

    context "user is valid after update" do
      before(:each) do
        @user = mock_user :email => "bob@bob.net"
        User.stub!(:find) { @user }
        @user.stub!(:update_without_password) { true }
        put 'update', :id => 3
      end

      it "should redirect to the users index" do
        response.should redirect_to(users_path)
      end

      it "should add a notice to the flash" do
        request.flash[:notice].should == \
          "User '#{@user.email}' was successfully updated."
      end
    end
  end
end
