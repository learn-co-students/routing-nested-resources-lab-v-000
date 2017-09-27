Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:index, :show]
  end

  resources :songs, only: [:index, :new, :create, :show, :update, :edit]
end
