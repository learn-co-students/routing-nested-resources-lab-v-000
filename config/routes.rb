Rails.application.routes.draw do
  resources :artists, only: [:show] do
    resources :songs, only: [:show, :index]
  end

  resources :artists, only: [:index, :new, :show, :edit, :update, :create, :destroy]
  resources :songs, only: [:index, :new, :show, :edit, :update, :create, :destroy]
end
