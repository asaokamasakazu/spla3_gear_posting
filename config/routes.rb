Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users' => 'users/registrations#new'
  end
  resources :gear_powers, only: [:index, :show]
  root :to => 'home#top'
end
