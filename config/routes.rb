Rails.application.routes.draw do
  root 'posts#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/search', to: 'posts#search', :as => 'search_page'

  

# https://guides.rubyonrails.org/routing.html#adding-member-routes
# This is a bit weird

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
