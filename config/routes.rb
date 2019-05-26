Rails.application.routes.draw do
  resources :artists do
    # Nested resources allow _path methods to be accessible to the controller, otherwise it will say undefined method
    # e.g all artists_songs: (artists/1/songs) or individual song by individual artist: (artists/1/songs/1)
    resources :songs, only: [:index, :show]
  end
  
  # Don't forget the original resource if you are adding the nested kind
  resources :songs
end
