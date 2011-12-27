class PagesController < ApplicationController
  def writers
    @writers = User.with_published_articles.order "last_name asc"
  end
end
