Contented::Application.routes.draw do
  devise_for :users
  resources :users

  resources :articles do
    resources :comments
    collection do
      get "uncategorized"
    end
    resources :assets, :only => [:create, :destroy]
  end

  resources :categories do
    resources :articles
  end

  resources :comments

  get "home/index"

  root :to => "articles#index"
end
