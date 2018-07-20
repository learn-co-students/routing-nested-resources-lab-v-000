Rails.application.routes.draw do  
  resources :artists do
    resources :songs, only: [:index, :show] # nested resource for songs
  end
  resources :songs
end
