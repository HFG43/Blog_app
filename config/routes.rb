Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :likes, only: [:create, :destroy]
        # get 'new', to: 'likes#new', on: :member
        # post 'like', to: 'likes#create', on: :member
        # delete 'unlike', to: 'likes#destroy', on: :member
      resources :comments, only: [:new, :create]
    end
  end

  root 'users#index'
end
