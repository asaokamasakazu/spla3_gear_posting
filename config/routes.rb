Rails.application.routes.draw do
  resources :gear_powers, only: [:index, :show]
  root :to => 'home#top'
end
