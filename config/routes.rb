Rails.application.routes.draw do
  devise_for :users
  get 'events/index'

  get 'events/new'

  get 'events/create'

  #get 'events/show'

  get 'events/:id' => 'events#show'
  resources :tickets

  root :to => "tickets#index"

  resources :events


end
