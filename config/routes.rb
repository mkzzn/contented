Contented::Application.routes.draw do
  get "categories/index"

  get "categories/new"

  get "categories/edit"

  get "articles/index"

  get "articles/view"

  get "articles/edit"

  get "articles/new"

  post "articles/create"

  root :to => "home#index"
end
