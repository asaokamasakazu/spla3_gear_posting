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
      get "precomplete"
    end
  end
  resources :gear_powers, only: [:index, :show]
  resources :contacts, only: [:index, :new] do
    collection do
      post "confirm"
      post "back"
      post "done"
    end
  end
  root "home#top"
end
