Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
  get "home/about"=>"homes#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
