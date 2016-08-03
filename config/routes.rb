Rails.application.routes.draw do

  resources :artists do
    # routes to songs as a nested resource of artist
    # only routes to index and show for songs
    resources :songs, only: [:index, :show ]
  end

  resources :songs
end
