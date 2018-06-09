Rails.application.routes.draw do
  resources :artists
  
  resources :artists do
    resources :songs, only: [:index, :show]
  end

  resources :songs


end


#get 'authors/:id/posts', to: 'authors#posts_index'
#get 'authors/:id/posts/:post_id', to: 'authors#post'
