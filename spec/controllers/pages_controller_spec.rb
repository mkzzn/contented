require 'spec_helper'

describe PagesController do
  describe "writers" do
    it "should get a list of users with published articles" do
      User.should_receive(:with_published_articles)
      get 'writers'
    end
  end
end
