require 'spec_helper'
require "cancan/matchers"

describe '/nav/_primary.html.haml' do
  #include Devise::TestHelpers

  def mock_user(stubs={})
    (@mock_user ||= mock_model(User).as_null_object).tap do |user|
      user.stub(stubs) unless stubs.empty?
    end
  end

  describe "pages controller" do
    context "homepage action" do
      it "should activate the 'Home' link" do
        controller.stub!(:controller_name) { "pages" }
        controller.stub!(:action_name) { "homepage" }
        render
        homepage_link = link_to "Home", root_path, :class => "home title active"
        rendered.should include(homepage_link)
      end
    end

    context "non-homepage action" do
      it "should not activate the 'Home' link" do
        controller.stub!(:controller_name) { "pages" }
        controller.stub!(:controller_name) { "puck man" }
        render
        homepage_link = link_to "Home", root_path, :class => "home title"
        rendered.should include(homepage_link)
      end
    end
  end

  describe "articles controller" do
    context "active" do
      it "should activate the articles link" do
        controller.stub!(:controller_name) { "articles" }
        render
        articles_link = link_to "Articles", articles_path, :class => "articles title active"
        rendered.should include(articles_link)
      end
    end

    context "inactive" do
      it "should not activate the articles link" do
        render
        articles_link = link_to "Articles", articles_path, :class => "articles title"
        rendered.should include(articles_link)
      end
    end
  end

  describe "categories controller" do
    context "active" do
      it "should activate the categories link" do
        controller.stub!(:controller_name) { "categories" }
        render
        categories_link = link_to "Categories", categories_path, :class => "categories title active"
        rendered.should include(categories_link)
      end
    end

    context "inactive" do
      it "should not activate the categories link" do
        render
        categories_link = link_to "Categories", categories_path, :class => "categories title"
        rendered.should include(categories_link)
      end
    end
  end

    context "" do
      it "should activate the categories link" do
        controller.stub!(:controller_name) { "categories" }
        render
        categories_link = link_to "Categories", categories_path, :class => "categories title active"
        rendered.should include(categories_link)
      end
    end

  describe "user info" do
    context "logged in" do
      before(:each) do
        controller.stub!(:current_user) { mock_user }
        controller.stub!(:user_signed_in?) { true }
        render
      end

      it "should have a link to sign out" do
        rendered.should include("Sign Out")
      end

      it "should have an account link" do
        rendered.should include("My Account")
      end
    end

    context "not logged in" do
      before(:each) do
        controller.stub!(:user_signed_in?) { false }
        render
      end

      it "should have a link to sign in" do
        rendered.should include("Sign In")
      end

      it "should have a link to register" do
        rendered.should include("Register")
      end
    end
  end

  describe "abilities" do
    before(:each) do
      stub_current_ability
    end

    describe "new article link" do
      before do
        @new_article_link = '<a href="/articles/new" class="new_article">New</a>'
      end

      context "user can create a new article" do
        it "should be visible" do
          @ability.can :manage, Article
          render
          rendered.should include(@new_article_link)
        end
      end

      context "user cannot create a new article" do
        it "should not be visible" do
          render
          rendered.should_not include(@new_article_link)
        end
      end
    end

    describe "new category link" do
      before do
        @new_category_link = '<a href="/categories/new" class="new_category">New</a>'
      end

      context "user can create a new category" do
        it "should be visible" do
          @ability.can :manage, Category
          render
          rendered.should include(@new_category_link)
        end
      end

      context "user cannot create a new category" do
        it "should not be visible" do
          render
          rendered.should_not include(@new_category_link)
        end
      end
    end
  end

  def stub_current_ability
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub!(:current_ability) { @ability }
  end
end
