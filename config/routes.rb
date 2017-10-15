Rails.application.routes.draw do
  resources :artists do 
  	resources :songs, only: [:index, :show]
  end
  # this is what we want /artists/1/songs/1
  resources :songs
end
