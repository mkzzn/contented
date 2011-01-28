Contented::Application.routes.draw do
  get "articles/show"
  resources :articles


  get "categories/index"

  get "categories/new"

  get "categories/edit"


  root :to => "articles#index"
end
