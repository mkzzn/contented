class ApplicationController < ActionController::Base
  protect_from_forgery
  ACTIONS = { :get => [:index, :edit, :new, :show] } 
end
