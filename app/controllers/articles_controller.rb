class ArticlesController < ApplicationController
  def index
  end

  def view
  end

  def edit
  end

  def new
    @article = Article.new
  end

end
