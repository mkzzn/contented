Contented::Application.routes.draw do
  get "categories/index"

  get "categories/new"

  get "categories/edit"
  resources :articles

  root :to => "home#index"
end
