Rails.application.routes.draw do
  devise_for :artists
  devise_for :users
  root to: "pages#home"
  resources :shortlists
  resources :artists
  resources :users
  resources :artworks, except: :show
  resources :opportunities
  resources :applications, except: :edit
end
