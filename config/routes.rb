Rails.application.routes.draw do
  resources :artists, only: [:show] do #block

    # Create nested resource routes to show all songs for an artist #(/artists/1/songs) and individual songs for that artist #(/artists/1/songs/1). Restrict the nested songs routes to index #and show actions only.

    # nested resource for songs
    resources :songs, only: [:show, :index]
  end

  resources :songs, only: [:index, :show, :new, :create, :edit, :update]

  resources :artists

  root 'songs#index'
end
