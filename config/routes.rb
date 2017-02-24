Rails.application.routes.draw do

  resources :artists, only: [:index, :new, :create, :update, :delete]

  resources :artists, only: [:show] do
      resources :songs, only: [:show, :index]
  end

  resources :songs
end
