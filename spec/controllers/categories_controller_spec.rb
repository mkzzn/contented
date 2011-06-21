require 'spec_helper'

describe CategoriesController do
  context "GET index" do
    it "should get all existing categories" do
      Category.should_receive(:all) { [mock_category, mock_category] }
      get "index"
    end
  end

  describe "GET edit" do
    before(:each) do
      stub_current_ability
      @category = mock_category(:id => 2)
      Category.stub!(:find) { @category }
    end

    context "user is authorized" do
      before(:each) do
        @ability.can :edit, Category
      end

      it "should fetch the target category" do
        Category.should_receive(:find).with(2) { @category }
        get :edit, :id => 2
      end
    end

    context "user is not authorized" do
      before(:each) do
        @ability.cannot :edit, Category
        get :edit, :id => 2
      end

      it "should redirect to the homepage" do
        response.should redirect_to(root_path)
      end

      it "should set a flash alert" do
        request.flash[:alert].should == "You are not authorized to access this page."
      end
    end
  end

  context "DELETE destroy" do
    before(:each) do
      @category = mock_category
      Category.stub!(:find) { @category }
      stub_current_ability
    end

    it "should fetch the target category" do
      Category.should_receive(:find).with(2)
      delete :destroy, :id => 2
    end
    
    context "user is authorized" do
       before(:each) do
        @ability.can :destroy, Category
      end

      it "should destroy the target category" do
        @category.should_receive(:destroy)
        delete :destroy, :id => 2
      end

      it "should set a flash notice" do
        delete :destroy, :id => 2
        request.flash[:notice].should == "category was successfully destroyed"
      end

      it "should redirect to the categories overview page" do
        delete :destroy, :id => 2
        response.should redirect_to(categories_path)
      end
    end

    context "user is not authorized" do
      before(:each) do
        @ability.cannot :destroy, Category
        delete :destroy, :id => 2
      end

      it "should redirect to the homepage" do
        response.should redirect_to(root_path)
      end

      it "should set a flash alert" do
        request.flash[:alert].should == "You are not authorized to access this page."
      end
    end
  end

  context "PUT update" do
    before(:each) do
      @params = { "description" => "herman", "title" => "craig" }
      @category = mock_category(:id => 2)
      Category.stub!(:find) { @category }
      stub_current_ability
    end

    it "should fetch the target category" do
      Category.should_receive(:find).with(2) { @category }
      put :update, :id => 2
    end

    context "user is authorized" do
      before(:each) do
        @ability.can :update, Category
      end

      context "category attributes update successfully" do
        before(:each) do
          @category.stub!(:update_attributes) { true }
          put "update", :id => 2, :category => @params
        end

        it "should set a flash notice" do
          request.flash[:notice].should == "Category was successfully updated."
        end

        it "should redirect to the categories index" do
          response.should redirect_to(categories_path)
        end
      end

      context "category attributes do not update successfully" do
        before(:each) do
          @category.stub!(:update_attributes) { false }
          put "update", :id => 2, :category => @params
        end

        it "should set a flash notice" do
          request.flash[:warning].should == "category was not updated"
        end

        it "should render the 'new' template" do
          response.should render_template("categories/new")
        end
      end
    end

    context "user is not authorized" do
      before(:each) do
        @ability.cannot :update, Category
        put "update", :id => 2, :category => @params
      end

      it "should redirect to the homepage" do
        response.should redirect_to(root_path)
      end

      it "should set a flash alert" do
        request.flash[:alert].should == "You are not authorized to access this page."
      end
    end
  end

  describe "GET 'new'" do
    before(:each) do
      stub_current_ability
      @category = mock_category
      Category.stub!(:new) { @category }
    end

    context "user is authorized" do
      before(:each) do
        @ability.can :build, Category
      end

      it "should build a new category" do
        Category.should_receive(:new)
        get 'new'
      end
    end

    context "user is not authorized" do
      before(:each) do
        @ability.cannot :build, Category
        get "new"
      end

      it "should redirect to the homepage" do
        response.should redirect_to(root_path)
      end

      it "should set a flash alert" do
        request.flash[:alert].should == "You are not authorized to access this page."
      end
    end
  end

  context "GET show" do
    before(:each) do
      @category = mock_category(:id => 2)
    end

    it "should fetch the target category" do
      Category.should_receive(:find).with(2) { @category }
    end

    after(:each) do
      get "show", :id => 2
    end
  end

  context "POST create" do
    before(:each) do
      @params = {"description" => "douglass", "title" => "fredrick"}
      @category = mock_category(@params)
      Category.should_receive(:create).with(@params) { @category }
    end

    it "should redirect to the categories index on success" do
      @category.stub!(:valid?) { true }
      post "create", :category => @params
      response.should redirect_to(categories_path)
    end

    it "should render the new action on failure" do
      @category.stub!(:valid?) { false }
      post "create", :category => @params
      response.should render_template("new")
    end
  end

  def mock_category(stubs={})
    (@mock_category ||= mock_model(Category).as_null_object).tap do |category|
      category.stub(stubs) unless stubs.empty?
    end
  end

  def mock_article(stubs={})
    (@mock_article ||= mock_model(Article).as_null_object).tap do |article|
      article.stub(stubs) unless stubs.empty?
    end
  end

  def stub_current_ability
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub!(:current_ability) { @ability }
  end
end
