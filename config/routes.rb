Rails.application.routes.draw do
  #resources :artists
  resources :songs
  #
  # get 'artists/:id/songs', to: 'artists#songs_index'
  # get 'artists/:id/songs/:song_id', to: 'artists#song'
  resources :artists do
   resources :songs, only: [:show, :index]
 end
end
