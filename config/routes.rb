Rails.application.routes.draw do
  resources :gear-powers, only: [:index, :show]
  root :to => 'home#top'
end
