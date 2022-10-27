Rails.application.routes.draw do
  devise_for :users
  resources :gear_powers, only: [:index, :show]
  root :to => 'home#top'
end
