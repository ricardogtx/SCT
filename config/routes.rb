Rails.application.routes.draw do

  #get 'users/new'

  resources :clinics do
  collection {post :import}
  end

  root 'home#index'

  resources :drugs
  resources :home

  get 'alcool/:id', to: 'drugs#show', as: :alcool
  get 'alucinogeno/:id', to: 'drugs#show', as: :alucinogeno
  get 'anfetamina/:id', to: 'drugs#show', as: :anfetamina
  get 'antidepressivo"/:id', to: 'drugs#show', as: :antidepressivo
  get 'barbiturico/:id', to: 'drugs#show', as: :barbiturico
  get 'cafeina/:id', to: 'drugs#show', as: :cafeina
  get 'cocaina/:id', to: 'drugs#show', as: :cocaina
  get 'inalantes/:id', to: 'drugs#show', as: :inalantes
  get 'maconha/:id', to: 'drugs#show', as: :maconha
  get 'narcotico/:id', to: 'drugs#show', as: :narcotico
  get 'nicotina/:id', to: 'drugs#show', as: :nicotina
  get 'tranquilizante/:id', to: 'drugs#show', as: :tranquilizante

  get 'drogas' => 'drugs#index'

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'

  get 'logout', to: 'users#logout', as: 'logout'
  get 'login', to: 'users#login', as: 'login'
  post 'login', to: 'users#login',  as: 'do_login'

  resources :users

  #get "login" => "sessions#new" #, :as => "log_in"
  #post "login" => "sessions#create"
  #get "logout" => "sessions#destroy" #, :as => "log_out"

  #get "singup" => "users#new" #, :as => "sing_up"
  #post "users" => "users#create"

  # :to => "user#new"
  #resources :users
  #resources :sessions
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
