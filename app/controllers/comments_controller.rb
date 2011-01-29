class CommentsController < ApplicationController
  def create
    @article = Article.find params[:article_id]
    @comment = @article.create_comment params[:comment]

    if @comment.valid?
      redirect_to @article
    else
      render "articles/show"
    end
  end
end
