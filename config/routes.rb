Rails.application.routes.draw do
  root 'static_pages#splash'

  resources :recipes

  get 'ingredients/new'
  get 'static_pages/splash'

  post 'ingredients', to: 'ingredients#create'
  post 'likes', to: 'likes#create'

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
end
