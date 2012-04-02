PersonalStockForecaster::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  get "pages/index", controller: 'pages', action: 'index'
  get "pages/home", controller: 'pages', action: 'home'
  get "pages/welcome", controller: 'pages', action: 'welcome'
  get "pages/about_us"
  get "pages/contact_us"

  root :to => 'pages#index'

  devise_for :users

  resources :stocks, only: [:index, :show] do
    resources :trading_days, only: [:show]
  end

  resources :shares

  get "predictions", controller: 'predictions', action: 'index'

  match "predictions/show", controller: 'predictions', action: 'show'

  #get "shares", controller: 'shares', action: 'index'
  #post "shares", controller: 'shares', action: 'create'
  #get "shares/new", controller: 'shares', action: 'new', as: "new_share"
  #get "shares/:id/edit", controller: 'shares', action: 'edit', as: "edit_share"
  #get "shares/:id", controller: 'shares', action: 'show', as: "share"
  #put "shares/:id", controller: 'shares', action: 'update'
  #delete "shares/:id", controller: 'shares', action: 'destroy'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
