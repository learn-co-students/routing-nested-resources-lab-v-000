Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:show, :index]
  end
  resources :songs
end

# resources :authors, only: [:show] do
#   # nested resource for posts
#   resources :posts, only: [:show, :index]
# end
