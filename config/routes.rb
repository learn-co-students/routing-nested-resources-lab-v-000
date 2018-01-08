Rails.application.routes.draw do

  resources :artists do#, only: [:show, :index] do
    resources :songs, only: [:index, :show]
  end

  resources :songs

  root 'songs#index'
  # resources :artists
  # resources :songs
end
