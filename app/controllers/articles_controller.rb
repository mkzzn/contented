class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def view
  end

  def edit
  end

  def create
    @article = Article.create params[:article]
    if @article.valid?
      flash[:notice] = "#{@article[:title]} was successfully created"
      redirect_to articles_path
    else
      render :template => "new"
    end
  end

  def new
    @article = Article.new
  end
  
end
