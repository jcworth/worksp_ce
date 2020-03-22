Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meetings do
    resources :attendees, only: [:new, :create, :edit, :update]
  end
  resources :groups

  get '/users/:username', to: "users#show", as: :user

end
