Contented::Application.routes.draw do
  resources :articles do
    resources :comments
    collection do
      get "uncategorized"
    end
  end

  resources :categories do
    resources :articles
  end

  resources :comments

  # User Routes
  resource :user_session
  resource :account, :controller => "users"
  resources :users
  resources :confirmations, :only => [:new, :create]

  get "home/index"

  root :to => "articles#index"
end
