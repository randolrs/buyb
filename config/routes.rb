Rails.application.routes.draw do
  
  resources :creators
  resources :posts
  resources :partnership_applications
  
  get 'order/add_offer_to_order'

  resources :offers
  #devise_for :users
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  devise_for :users # :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  
  root 'pages#home'

  get '/about_us' => 'pages#about_us', as: 'about_us'

  get '/signup/' => 'pages#signup', as: 'signup'

  get '/signup/newsletter' => 'pages#email_signup', as: 'email_signup'

  get '/login/' => 'pages#login', as: 'login'

  get '/blog/' => 'posts#blog_home', as: 'blog_home'

  get '/partneships/' => 'partnership_applications#new', as: 'partnership_application_page'

  get '/newsletter_signups/' => 'pages#newsletter_signups', as: 'newsletter_signups'


  #match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup 

  get '/:name_url_slug' => 'offers#show_formatted', as: 'show_offer_formatted'

  

  get '/blog/:post_url_slug' => 'posts#show_formatted', as: 'show_formatted_post'


  get '/category/:category_url_slug' => 'pages#offer_category_index', as: 'offer_category_index'

  post '/newsletter_signup/create/' => 'pages#create_newsletter_subscriber', as: 'create_newsletter_subscriber'
  
  get '/order/:order_id/review' => 'orders#review', as: 'review_order'

  get '/:offer_url_slug/buy/' => 'orders#add_offer_to_order', as: 'add_offer_to_order'

  get '/order/:order_id/confirmation' => 'orders#confirmation', as: 'order_confirmation'

  post '/order/:order_id/confirm' => 'orders#confirm_and_pay_for_order', as: 'confirm_and_pay_for_order'

  get '/order/order_offer/update_quantity/:order_offer_id/:new_quantity' => 'orders#update_order_offer_quantity', as: 'update_order_offer_quantity'

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
