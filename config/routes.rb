Rails.application.routes.draw do
  resources :artists do
    resource :songs, only: [:index, :show]
  end
  resources :songs
end
