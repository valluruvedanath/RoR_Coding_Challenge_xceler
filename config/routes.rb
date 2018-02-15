
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        get 'events/list', to: 'events#index', defaults: {format: 'json'}
        #post 'events/add', to: 'events#joining_to_event'
    resources :events
    end
    namespace :admin do
      get 'events/list', to: 'events#index', defaults: {format: 'json'}
      post 'events/add', to: 'events#create_event_by_admin'
      resources :events
    end
  end
  resources :events
  get 'sessions/new'
  resources :sessions
  resources :users
  get 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
