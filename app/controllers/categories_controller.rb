class CategoriesController < ApplicationController
  before_filter :fetch_category, :only => [:edit, :update, :show]
  before_filter :fetch_all_categories, :only => ACTIONS[:get]

  def index
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

  protected
  def fetch_category
    @category = Category.find params[:id]
  end
end
