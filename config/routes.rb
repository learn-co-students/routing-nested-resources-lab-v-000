Rails.application.routes.draw do

# /artists/1/songs

  # resources :artists
  # resources :songs

  resources :artists do
    # nested resource for songs
    resources :songs, only: [:index, :show]
  end

  resources :songs


end
