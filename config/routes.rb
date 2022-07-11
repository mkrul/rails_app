Rails.application.routes.draw do
  resources :books do
    collection do
      post :bulk_upload
      delete :bulk_destroy
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  resources :forum_threads do
    resources :forum_posts, module: :forum_threads
  end
end
