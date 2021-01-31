Rails.application.routes.draw do

  # deleted code
  # resources :artists

  # https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-10-routes-and-resources/routing-and-nested-resources-lab
  # Create nested resource routes to show all songs for an artist
  # (/artists/1/songs) and individual songs for that artist
  # (/artists/1/songs/1). Restrict the nested songs routes to index
  # and show actions only.
  
  # new code
  resources :artists do
    resources :songs, only: [:index, :show]
  end

  resources :songs
end
