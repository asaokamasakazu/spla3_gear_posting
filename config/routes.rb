Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :users, only: [:show] do
    collection do
      get "list"
      get "account"
    end
  end
  resources :gear_powers, only: [:index, :show]
  root :to => "home#top"
end
