Widgit::Engine.routes.draw do
  root 'admin/pages#index'

  namespace :admin do
    resources :pages, except: [:show]
  end
end
