Contented::Application.routes.draw do
  get "users/index"

  get "users/edit"

  get "users/update"

  get "users/create"

  devise_for :users
  resources :users

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

  get "home/index"

  root :to => "articles#index"
end
