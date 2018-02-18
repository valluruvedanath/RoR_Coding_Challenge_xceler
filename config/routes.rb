
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        get 'events/list', to: 'events#index', defaults: {format: 'json'}
        post 'events/add', to: 'events#user_attend_to_event'
        post 'events/cancelbyuser', to: 'events#user_canceled_event'
        #post 'events/add', to: 'events#joining_to_event'
    resources :events
    end
    namespace :admin do
      get 'events/list', to: 'events#index', defaults: {format: 'json'}
      post 'events/add', to: 'events#create_event_by_admin'
      post 'events/confirmAttendees', to: 'events#attendees_confirmed_by_admin'
      post 'events/removeAttendees', to: 'events#attendees_removed_by_admin'
      get 'events/confirmed/list', to: 'events#confirmed_list'
      get 'events/removed/list', to: 'events#removed_list'
      get 'events/intersetedusers', to: 'events#user_intrested_events', defaults: {format: 'json'}
      get 'events/attendeeswillingcount', to: 'events#attendees_willing_count', defaults: {format: 'json'}
      get 'events/attendeesnotwillingcount', to: 'events#attendees_not_willing_count', defaults: {format: 'json'}
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
