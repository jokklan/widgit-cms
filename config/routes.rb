Widgit::Engine.routes.draw do
  resources :pages, only: [:show]

  namespace :admin do
    root 'pages#index'

    resources :pages, except: [:show]
    resources :blocks, only: [:new]
    resources :images, only: [:create]
    resources :components, only: [:new]
  end
end
