Rails.application.routes.draw do

 resources :clinics do
   collection {post :import}
end
 root 'home#index'

 resources :drugs
 resources :home

 get 'alcool/:id', to: 'drugs#show', as: :alcool
 get 'Alucinogenos/:id', to: 'drugs#show', as: :Alucinogenos
 get 'Anfetaminas/:id', to: 'drugs#show', as: :Anfetaminas
 get 'Antidepressivos"/:id', to: 'drugs#show', as: :Antidepressivos
 get 'Barbituricos/:id', to: 'drugs#show', as: :Barbituricos
 get 'Cafeina/:id', to: 'drugs#show', as: :Cafeina
 get 'Cocaina/:id', to: 'drugs#show', as: :Cocaina
 get 'Inalantes/:id', to: 'drugs#show', as: :Inalantes
 get 'Maconha/:id', to: 'drugs#show', as: :Maconha
 get 'Narcoticos/:id', to: 'drugs#show', as: :Narcoticos
 get 'Nicotina/:id', to: 'drugs#show', as: :Nicotina
 get 'Tranquilizantes/:id', to: 'drugs#show', as: :Tranquilizantes

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
