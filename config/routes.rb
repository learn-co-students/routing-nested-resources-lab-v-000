Rails.application.routes.draw do
  resources :artists, only: [:index, :new, :create, :edit, :show, :update, :destroy] do
  	resources :songs, only: [:show, :index]
  end
  resources :songs
end
