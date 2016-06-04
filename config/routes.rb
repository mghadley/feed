Rails.application.routes.draw do
  root 'static_pages#splash'

  mount Commontator::Engine => '/commontator'

  resources :recipes


  get 'new_ingredients', to: 'ingredients#new'
  get 'static_pages/splash'

  post 'add_one', to: 'ingredients#add_one'
  post 'search', to: 'recipes#search'
  post 'ingredients', to: 'ingredients#create'
  post 'likes', to: 'likes#create'
  post 'remove_image', to: 'recipes#remove_image'

  delete 'ingredients', to: 'ingredients#destroy'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
end
