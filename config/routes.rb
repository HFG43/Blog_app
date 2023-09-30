Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show]
  end

  # get 'users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'

  root 'users#index'
end
