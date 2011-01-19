class ArticlesController < ApplicationController
  def index
  end

  def view
  end

  def edit
  end

  def create
    @article = Article.create(params[:article])
  end

  def new
    @article = Article.new
  end

end
