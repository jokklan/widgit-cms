Widgit::Engine.routes.draw do
  resources :pages, only: [:show]

  namespace :admin do
    root 'pages#index'

    resources :pages, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :blocks, only: [:new]
    resources :images, only: [:create]
    resources :tiles, only: [:show, :update]
    resources :components, only: [:new]
  end
end
