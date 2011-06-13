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
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_without_password params[:user]
      flash[:notice] = "User '#{@user.email}' was successfully updated."
      redirect_to users_path
    else
      render :action => "edit"
    end
  end
end
