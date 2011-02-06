class ApplicationController < ActionController::Base
  protect_from_forgery
  ACTIONS = { :get => [:index, :edit, :new, :show] } 

  protected
  def fetch_all_categories
    @categories = Category.all
  end
end
