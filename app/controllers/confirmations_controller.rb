class ConfirmationsController < ApplicationController
  def create
    @user = User.find_using_perishable_token params[:confirmation]

    if @user
      @user.confirm!
      redirect_to root_path
    else
      render :action => "new"
    end
  end
end
