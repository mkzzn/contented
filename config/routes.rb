Contented::Application.routes.draw do
  get "categories/index"

  get "categories/new"

  get "categories/edit"

  resources :articles
  get "articles/show"
  root :to => "articles#index"
end
