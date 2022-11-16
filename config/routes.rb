Rails.application.routes.draw do
  resources :posts do
    collection do
      get "search"
    end
    resources :favorites, only: [:create, :destroy]
  end
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_scope :user do
    post "users/guest_sign_in" => "users/sessions#guest_sign_in"
  end
  resources :users, only: [:show] do
    collection do
      get "list"
      get "account"
      get "search"
    end
  end
  resources :gear_powers, only: [:index, :show]
  root "home#top"
end
