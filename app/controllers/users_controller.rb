class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create params[:user]
    if @user.valid?
      redirect_to confirm_users_path
    else
      render :action => "new"
    end
  end

  def confirm
  end
end
