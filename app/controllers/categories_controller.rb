class CategoriesController < ApplicationController
  before_filter :fetch_category, :only => [:edit]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create params[:category]
    
    if @category.valid?
      flash[:notice] = @category[:title] + " was created"
      redirect_to categories_path
    else
      flash[:warning] = "category was not created"
      render :action => "new"
    end
  end

  def edit
  end

  protected
  def fetch_category
    @category = Category.find params[:id]
  end
end
