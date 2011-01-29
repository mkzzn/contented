class CommentsController < ApplicationController
  def create
    @article = Article.find params[:article_id]
    @comment = @article.create_comment params[:comment]
  end
end
