Rails.application.routes.draw do
  # /artists/1/songs & /artists/1/songs/1
  # get 'artists/:id/songs', to: 'artists#songs_index'
  # get 'artists/:id/songs/:song_id', to: 'artists#song'
  resources :artists do
    resources :songs, only: [:index, :show]
  end

  resources :songs
end
