Rails.application.routes.draw do

root to: "homes#top"

  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }

resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end

  get "home/about"=>"homes#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
