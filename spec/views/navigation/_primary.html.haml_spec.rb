require 'spec_helper'

describe '/nav/_primary.html.haml' do
  def mock_user(stubs={})
    (mock_model(User).as_null_object).tap do |user|
      user.stub(stubs) unless stubs.empty?
    end
  end

  context "pages controller" do
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

  context "articles controller" do
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

  context "categories controller" do
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

  context "user" do
    context "logged in" do
      before(:each) do
        @mock_user = mock_user :login => "monkey", :id => 22
        controller.stub!(:current_user) { @mock_user }
        render
      end

      it "should have a link to sign out" do
        rendered.should include("Sign Out")
      end

      it "should have a link to sign out" do
        rendered.should include("My Account")
      end
    end

    context "not logged in" do
      before(:each) do
        controller.stub!(:current_user) { false }
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
end
