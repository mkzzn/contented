class ConfirmationsController < ApplicationController
  def create
    @user = User.find_by_perishable_token params[:confirmation]

    if @user
      @user.confirm!
      redirect_to articles_path
    else
      render :action => "new"
    end
  end
end
