Rails.application.routes.draw do
  resources :artists, only: [:index, :show] do
    resources :songs, only: [:index]
  end
  resources :songs, only: [:index]
  #resources :songs, only: [:index, only: [:show, :edit, :update, :destroy]
end
