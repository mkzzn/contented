class CategoriesController < ApplicationController
  before_filter :fetch_category, :only => [:edit, :update, :show, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    authorize! :build, @category
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
    authorize! :edit, Category
  end

  def show
  end

  def update
    if @category.update_attributes params[:category]
      flash[:notice] = @category[:title] + " was successfully updated"
      redirect_to categories_path
    else
      flash[:warning] = "category was not updated"
      render :action => "new"
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "category was successfully destroyed"
    redirect_to categories_path
  end

  protected
  def fetch_category
    @category = Category.find params[:id]
  end
end
