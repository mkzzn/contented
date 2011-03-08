require 'spec_helper'

describe '/nav/_primary.html.haml' do
  context "pages controller" do
    context "homepage action" do
      it "should activate the home link" do
        controller.stub!(:controller_name) { "pages" }
        controller.stub!(:action_name) { "homepage" }
        render
        homepage_link = link_to "Home", root_path, :class => "home title active"
        rendered.should include(homepage_link)
      end
    end
  end

  context "articles controller" do
    it "should activate the articles link" do
      controller.stub!(:controller_name) { "articles" }
      render
      articles_link = link_to "Articles", articles_path, :class => "articles title active"
      rendered.should include(articles_link)
    end
  end

  context "categories controller" do
    it "should activate the categories link" do
      controller.stub!(:controller_name) { "categories" }
      render
      categories_link = link_to "Categories", categories_path, :class => "categories title active"
      rendered.should include(categories_link)
    end
  end
end
