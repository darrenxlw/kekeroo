Rails.application.routes.draw do

  
  get 'errors/not_found'
  get 'errors/internal_server_error'

  get 'download'  => 'static_pages#download'
  get 'help'      => 'static_pages#help'
  get 'imprint'   => 'static_pages#imprint'
  get 'signup'    => 'users#new'
  get 'login'    => 'users#new'

  root 'sessions#new'
  post  'login'  => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get "/404" => "errors#not_found"
  get "/users/404" => "errors#user_not_found"
  get "/users/500" => "errors#user_not_found"
  get "/500" => "errors#internal_server_error"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'landing_page#home'
  resources :users 
  resources :messages
    get '/realtime/messages' => 'realtime#messages', :as => :realtime_messages



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
