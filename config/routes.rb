Rails.application.routes.draw do
<<<<<<< HEAD
  resources :artists do
    resources :songs, only: [:show, :index]
  end
=======
  resources :artists
>>>>>>> 60f92d6495cfaaf6c144bf137258bd9b693bbaaf
  resources :songs
end
