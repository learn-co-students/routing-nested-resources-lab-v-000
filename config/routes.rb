Rails.application.routes.draw do
  #resources :artists, only: [:new, :create, :edit, :update, :destroy]
  resources :artists do 
  	resources :songs, only: [:index, :show]
  end
  resources :songs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
