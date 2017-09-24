Rails.application.routes.draw do
  resources :artists, only: [:show, :index] do
    resources :songs, only: [:show, :index]
  end
  resources :artists, only: [:new, :create, :edit, :update]
  resources :songs
end
