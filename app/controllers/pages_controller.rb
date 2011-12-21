class PagesController < ApplicationController
  def writers
    User.with_published_articles
  end
end
