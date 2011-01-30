class CommentsController < ApplicationController
  def create
    @article = Article.find params[:article_id]
    @comment = @article.comments.create params[:comment]

    if @comment.valid?
      redirect_to @article
    else
      @comments = @article.comments.reject {|comment| not comment.valid? }
      render "articles/show"
    end
  end
end
