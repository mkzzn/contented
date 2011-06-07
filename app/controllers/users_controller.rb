class UsersController < ApplicationController
  def index
    if cannot? :read, User.new
      flash[:warning] = "You do not have permission to view that page."
      redirect_to "/"
    end
  end
end
