Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "games#welcome"

  get 'games/welcome' => 'games#welcome', as: :welcome
  get 'games/new' => 'games#new', as: :game_new
  post 'games/create' => 'games#create', as: :game_create
  post 'games/joins' => 'games#show_joins', as: :show_joins

  get 'games/:id/get_links' => 'games#get_links', as: :game_links
  get 'games/:id/show' => 'games#show', as: :game_show
  post 'games/:id/calculate' => 'games#calculate', as: :game_calculate
  post 'games/:id/results' => 'games#results', as: :game_results

  get 'games/:id/minions/new' => 'minions#new', as: :minion_new
  post 'games/:id/minions/create' => 'minions#create', as: :minion_create
  get 'minions/:id/show' => 'minions#show', as: :minion_show
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
