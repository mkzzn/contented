Contented::Application.routes.draw do
  resources :articles do
    resources :comments
  end

  resources :categories do
    resources :articles
  end

  resources :comments

  get "categories/index"

  get "categories/new"

  get "categories/edit"

  get "home/index"

  root :to => "articles#index"
end
