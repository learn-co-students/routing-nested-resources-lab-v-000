Rails.application.routes.draw do

  resources :artists do
  # resources :artists, shallow: true do
    # nested resource for songs
    resources :songs, only: [:show, :index]
  end

  resources :songs

  root 'song#index'

 end
