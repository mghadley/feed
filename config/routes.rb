Rails.application.routes.draw do
  root 'static_pages#splash'

  resources :recipes

  get 'new_ingredients', to: 'ingredients#new'
  get 'static_pages/splash'

  post 'ingredients', to: 'ingredients#create'

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
end
