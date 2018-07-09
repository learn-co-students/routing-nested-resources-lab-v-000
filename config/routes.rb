Rails.application.routes.draw do
  resources :artists, only: [:index, :show, :new, :edit] do
    resources :songs, only: [:index, :show]
  end
  resources :songs, only: [:index, :show, :new, :edit]
end
