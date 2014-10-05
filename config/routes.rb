Widgit::Engine.routes.draw do
  resources :pages, only: [:show]

  namespace :admin do
    root 'pages#index'

    resources :pages, except: [:show]
  end
end
