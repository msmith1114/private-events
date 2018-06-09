Rails.application.routes.draw do
  #Static Pages
  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  #Users
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  #Sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #Invites
  get '/invites/:id/accept', to: 'invites#accept', as: :invite_accept
  get '/invites/:id/reject', to: 'invites#deny', as: :invite_reject

  #Resources
  resources :users, except: [:index,:destroy]
  resources :events
  resources :invites, only: [:create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
