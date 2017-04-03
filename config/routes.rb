Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:show, :index]
  end

  resources :songs
  #
  # get 'artists/:id/songs', to: 'artists#songs_index'
  # get 'artists/:id/songs/:song_id', to: 'artists#song'
end
