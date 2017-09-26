Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:show, :index]
  end

  resources :songs, only: [:index, :new, :create, :show, :update, :edit]
end
