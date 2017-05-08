Rails.application.routes.draw do
  resources :artists, only: [:index, :show, :new, :create, :edit, :update] do
    resources :songs, only: [:show, :index]
  end

  resources :songs
end
