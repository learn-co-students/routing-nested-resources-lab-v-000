# Rails.application.routes.draw do
#   resources :artists
#   resources :songs
# end

Rails.application.routes.draw do

  resources :artists do
    # nested resource for songs
    resources :songs, only: [:show, :index]
  end

  resources :songs, only: [:index, :show, :new, :create, :edit, :update]

end
