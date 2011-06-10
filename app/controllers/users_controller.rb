class UsersController < ApplicationController
  def index
    if can? :read, User.new
      @users = User.all
    else
      flash[:warning] = "You do not have permission to view that page."
      redirect_to "/"
    end
  end

  def edit
    
  end
end
