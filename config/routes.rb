Contented::Application.routes.draw do
  resources :articles

  get "categories/index"

  get "categories/new"

  get "categories/edit"

  get "home/index"

  root :to => "articles#index"
end
