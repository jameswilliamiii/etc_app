EtcApp::Application.routes.draw do

  get "class_offers/index"
  get "class_offers/show"
  get "user/show"
  root 'static_pages#home'

  # This route must be above the devise routes to keep people from going to sign_up action
  get "/users/sign_up" => redirect('/users/sign_in')

  devise_for :users, :controllers => { :invitations => 'admin/invitations' }

  devise_scope :user do
    get 'user', :to => 'users#show', :as => :user_root
    get "admin/users/invitation/new" => "devise/invitations#new"
  end

  resources :profiles

  get  "/index"              => "static_pages#home",               as: :home
  get  "/events"             => "static_pages#events",             as: :events
  get  "/apply"              => "static_pages#apply",              as: :apply
  post "/apply"              => "static_pages#apply_email",        as: :application
  get  "/apply/confirmation" => "static_pages#apply_confirmation", as: :apply_confirmation
  get  "/pricing"            => "static_pages#pricing",            as: :pricing
  get  "/class-registration" => "static_pages#class_registration", as: :class_registration

  get  "errors/error_404"
  get  "errors/error_500"

  namespace :admin do
    resources :users, except: [ :new, :create ] do
      post "/invite" => "users#invite_user"
    end
    resources :class_offers, path: "classes"
  end

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

  resources :classes, only: [ :index, :show ], controller: :class_offers

  post "specials/email" => "specials#email", as: :specials_email
  get  "specials/:campaign" => "specials#show", as: :special

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
