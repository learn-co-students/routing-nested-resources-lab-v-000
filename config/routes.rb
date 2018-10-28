Rails.application.routes.draw do
  resources :artists do
    # nested resource for songs
    resources :songs, only: [:index, :show]
  end
  resources :songs
end
