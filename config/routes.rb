Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:show, :index] #so you can see all songs for an artist(index), and an individual song for an artist(show)
  end
  
  resources :songs
end
