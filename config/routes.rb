Contented::Application.routes.draw do
  devise_for :users
  resources :users

  resources :articles do
    resources :comments
    collection do
      get "uncategorized"
    end
  end
  match '/feed' => 'articles#feed', :as => :feed, :defaults => { :format => 'atom' }
  match '/search' => 'articles#search', :as => :search

  resources :categories do
    resources :articles
  end

  resources :comments

  get "home/index"

  root :to => "articles#index"
end
