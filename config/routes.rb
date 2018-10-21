Rails.application.routes.draw do
  #resources :artists
  resources :artists do

   resources :songs, only: [:show, :index]
 end

  resources :songs
end
