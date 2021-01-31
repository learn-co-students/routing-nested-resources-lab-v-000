Rails.application.routes.draw do

  resources :artists, only: [:index] do
    resources :songs, only: [:index, :show]
  end

  resources :artists

  resources :songs

end
