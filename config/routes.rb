Rails.application.routes.draw do

  resources :artists, only: [:show] do
    # nested resource for songs
    resources :songs, only: [:show, :index]
  end

  resources :artists, only: [:index, :show, :new, :create, :edit, :update]
  root 'artists#index'

  # resources :artists
  # resources :songs

 end
