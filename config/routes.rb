Rails.application.routes.draw do

  #get 'users/new'

  resources :clinics
  root 'home#index'

  resources :drugs
  resources :home
  resources :parsers do
  collection {post :import}
end

  get 'drogas' => 'drugs#index'

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'

  get 'logout', to: 'users#logout', as: 'logout'
  get 'users/profile', to: 'users#profile', as: 'users_profile'
  get 'users/profile/edit', to: 'users#edit', as: 'users_profile_edit'
  post 'index', to: 'users#index',  as: 'do_login'
  get 'users/admin', to: 'users#admin', as: 'admin'
  post 'users/admin', to: 'users#admin',  as: 'post_admin'
  get 'users/admin/testimonial_approval', to: 'users#testimonial_approval', as: 'testimonial_approval'
  get 'users/admin/users_approval', to: 'users#users_approval', as: 'users_approval'
  get 'users/admin/users_approval_confirm', to: 'users#users_approval_confirm', as: 'users_approval_confirm'
  get 'users/admin/users_approval_decline', to: 'users#users_approval_decline', as: 'users_approval_decline'
  get 'users/clinic/edit', to: 'users#clinic_edit', as: 'users_clinic_edit'
  get "users/admin/user_admin_applying", to: "users#user_admin_applying", as: "user_admin_applying"
  get "users/admin/user_admin_applying_confirm", to: "users#user_admin_applying_confirm", as: "user_admin_applying_confirm"
  get "users/admin/user_admin_applying_decline", to: "users#user_admin_applying_decline", as: "user_admin_applying_decline"

  get 'users/admin/testimonials_approval_confirm', to: 'users#testimonials_approval_confirm', as: 'testimonials_approval_confirm'
  get 'users/admin/testimonials_approval_decline', to: 'users#testimonials_approval_decline', as: 'testimonials_approval_decline'
  get 'users/admin/testimonials_approval_edit', to: 'users#testimonials_approval_edit', as: 'testimonials_approval_edit'

  resources :users

  get 'saiba_mais' => 'home#about'
  get 'mapa_geral' => 'clinics#general_maps'
  resources :testimonials
  get 'mapa_geral' => 'clinics#general_maps'

  get 'depoimentos'           =>   'testimonials#show'
  get 'depoimentos/novo'      =>   'testimonials#new'
  get 'depoimentos/editar'    =>   'testimonials#edit'

  get 'clinics/id_of_city' => 'clinics#id_of_city'
  post 'clinics/id_of_city' => 'clinics#id_of_city'

  resources :campaigns

  get 'campanhas' => 'campaigns#index'
  get 'campanhas/nova' => 'campaigns#new'

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
