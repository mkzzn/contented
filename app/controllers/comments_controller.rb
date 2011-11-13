class CommentsController < ApplicationController
  def create
    @article = Article.find params[:article_id]
    @comment = @article.comments.create params[:comment].merge(:user_id => current_user[:id])

    if @comment.valid?
      redirect_to @article
    else
      @comments = @article.comments.reject {|comment| not comment.valid? }
      render "articles/show"
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy and flash[:notice] = @comment.body + " has been deleted"
    redirect_to @comment.article
  end
end
