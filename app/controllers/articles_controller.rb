class ArticlesController < ApplicationController
  before_filter :fetch_article, :only => [:show, :update, :edit, :destroy]

  def index
    if Ability.new(current_user).can_view_rough_drafts
      @articles = Article.order "created_at desc"
    else 
      @articles = Article.published.order "created_at desc"
    end

    respond_to do |format|
      format.html     # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  def show
    authorize! :view, @article
    @comments = @article.comments
    @comment = Comment.new :article_id => @article.id
  end

  def search
    if Ability.new(current_user).can_view_rough_drafts
      @articles = Article.search params[:keyword]
    else
      @articles = Article.search params[:keyword], :conditions => 
        { :published => true }
    end
  end

  def uncategorized
    @articles = Article.uncategorized
  end

  def edit
    authorize! :edit, @article
    5.times { @article.attachments.build }
  end

  def feed
    @articles = Article.published.order("created_at desc").limit(10)
    respond_to do |format|
      format.atom
    end
  end

  def create
    authorize! :create, Article
    @article = Article.create params[:article].merge(:user_id => current_user[:id])
    if @article.valid?
      flash[:notice] = "#{@article.title} was successfully created"
      redirect_to articles_path
    else
      flash[:warning] = "Article creation failed"
      render :action => "new"
    end
  end

  def update
    authorize! :update, @article
    @article.update_attributes params[:article]
    if @article.valid?
      flash[:notice] = "#{@article[:title]} was saved to category #{@article.category_name}"
      redirect_to(article_path(@article))
    else
      render :action => "new"
    end
  end

  def new
    authorize! :build, Article
    @article = Article.new
    5.times { @article.attachments.build }
  end

  def destroy
    authorize! :destroy, @article
    @article.destroy
    flash[:notice] = "Article was successfully destroyed"
    redirect_to articles_path
  end

  protected
  def fetch_article
    @article = Article.find params[:id]
  end
end
