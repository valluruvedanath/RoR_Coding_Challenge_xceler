Rails.application.routes.draw do
  resources :events
  get 'sessions/new'
  resources :sessions
  resources :users
  get 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
