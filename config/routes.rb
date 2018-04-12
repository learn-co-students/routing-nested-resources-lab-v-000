Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:index, :show]
  end
  resources :songs, only: [:index, :show]
  #resources :songs, only: [:index, :show, :edit, :update, :destroy]
end
