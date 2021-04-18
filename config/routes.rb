Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "posts#index"

  resources :posts do
    resources :comments do
      put "like" => "comments#vote"
    end
    put "like" => "posts#vote"
  end

  resources :users 
  resources :profiles
  resources :invitations
  resources :searches, only: [:index]
end
