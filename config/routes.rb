Rails.application.routes.draw do
  root 'static_pages#splash'

  resources :recipes

  get 'new_ingredients', to: 'ingredients#new'
  get 'static_pages/splash'

  post 'ingredients', to: 'ingredients#create'
  post 'likes', to: 'likes#create'


  delete 'ingredients', to: 'ingredients#destroy'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
end
