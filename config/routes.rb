Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meetings
  resources :groups
  resources :attendees, only: [:new, :create, :edit, :update]

  get '/users/:username', to: "users#show", as: :user

end
