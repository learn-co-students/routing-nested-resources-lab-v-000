Rails.application.routes.draw do
  resources :songs

  resources :artists do
  # nested resource for posts
  resources :songs, only: [:show, :index]
end

end
