class PagesController < ApplicationController
  def writers
    @writers = User.with_published_articles
  end
end
