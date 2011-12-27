require 'spec_helper'

describe PagesController do
  describe "writers" do
    it "should get a list of users with published articles" do
      published_articles = mock("published articles").as_null_object
      User.should_receive(:with_published_articles) { published_articles }
      published_articles.should_receive(:order).with("last_name asc")
      get 'writers'
    end
  end
end
