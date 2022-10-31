Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users' => 'users/registrations#new'
  end
  resources :users, only: [:show]
  resources :gear_powers, only: [:index, :show]
  root :to => 'home#top'
end
