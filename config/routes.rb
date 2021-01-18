Rails.application.routes.draw do
  root 'posts#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/posts/search', to: 'posts#search', :as => 'search_page'

  resources :posts do
    member do
      post :vote
    end
    resources :comments do
      member do
        post :vote
      end
    end
  end
  resources :users
end
