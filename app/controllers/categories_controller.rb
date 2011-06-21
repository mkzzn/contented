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
    authorize! :create, Category
    @category = Category.create params[:category]
    if @category.valid?
      flash[:notice] = "Category was successfully created."
      redirect_to categories_path
    else
      flash[:warning] = "Category was not created."
      render :action => "new"
    end
  end

  def edit
    authorize! :edit, Category
  end

  def show
  end

  def update
    authorize! :update, @category
    if @category.update_attributes params[:category]
      flash[:notice] = "Category was successfully updated."
      redirect_to categories_path
    else
      flash[:warning] = "category was not updated"
      render :action => "new"
    end
  end

  def destroy
    authorize! :destroy, @category
    @category.destroy
    flash[:notice] = "category was successfully destroyed"
    redirect_to categories_path
  end

  protected
  def fetch_category
    @category = Category.find params[:id]
  end
end
