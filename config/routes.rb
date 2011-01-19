Contented::Application.routes.draw do
  get "articles/index"

  get "articles/view"

  get "articles/edit"

  get "articles/new"

  root :to => "home#index"
end
