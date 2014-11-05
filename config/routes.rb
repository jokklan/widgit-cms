Widgit::Engine.routes.draw do
  resources :pages, only: [:show]

  namespace :admin do
    root 'pages#index'

    resources :pages, except: [:show]
    resources :widget_groups, only: [:new]
    resources :images, only: [:create]
  end
end
