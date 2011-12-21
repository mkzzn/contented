class UsersController < ApplicationController
  before_filter :fetch_user, :except => [:index]

  def index
    @users = User.all
    authorize! :index, @users
  end

  def edit
  end

  def show
  end

  def update
    if @user.update_attributes filtered_params
      flash[:notice] = "User '#{@user.email}' was successfully updated."
      redirect_to users_path
    else
      render :action => "edit"
    end
  end

  private

  def fetch_user
    @user = User.find params[:id]
  end

  def filtered_params
    ParamFilter.new(params[:user]).filter_empty_passwords
  end
end
