Rails.application.routes.draw do
  root 'posts#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/signup', to: 'users#new'

  

# https://guides.rubyonrails.org/routing.html#adding-member-routes
# This is a bit weird

  resources :posts do
    member do
      post :vote
    end
    resources :comments
  end
  resources :users
end
