Rails.application.routes.draw do
  devise_for :artists
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :artists
  resources :users
  # Defines the root path route ("/")
  # root "articles#index"
  resources :artworks, except: :show

  resources :opportunities do
    resources :applications, except: :edit
  end
end
