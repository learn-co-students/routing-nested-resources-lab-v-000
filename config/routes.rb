Rails.application.routes.draw do

  #create nested resource all songs for artist + individual songs
  resources :artists do
    resources :songs, only: [:index, :show]
  end

  resources :songs
end
