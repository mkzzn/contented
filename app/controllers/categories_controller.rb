class CategoriesController < ApplicationController
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

end
