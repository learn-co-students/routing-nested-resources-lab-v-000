Rails.application.routes.draw do

  resources :artists, only: [:show, :index] do
    # nested resource for artists
    resources :songs, only: [:show, :index]
  end

  resources :songs


end
