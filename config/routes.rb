Contented::Application.routes.draw do
  devise_for :users
  resources :users

  resources :articles do
    resources :comments
    collection do
      get "uncategorized"
      # get "feed"
    end
  end
  match '/feed' => 'articles#feed', :as => :feed, :defaults => { :format => 'atom' }

  resources :categories do
    resources :articles
  end

  resources :comments

  get "home/index"

  root :to => "articles#index"
end
