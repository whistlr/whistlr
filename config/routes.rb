Whistlr::Application.routes.draw do
  root 'static#home'

  get 'welcome' => 'generic#show'

  concern :resourceful do
    member do
      resources :reports
    end
  end

  concern :eventful do
    member do
      resources :events, path: :timeline
    end
  end

  devise_for :users, path: 'auth'
  resources :users, except: [:new, :destroy]

  resource :follows, only: [:create]
  resource :votes, only: [:create]
  resources :uploads, only: [:create]

  resources :events, only: [:index]
  resources :compliments, only: [:index]

  resources :affiliations

  resources :reports, only: [:create, :edit, :update, :show, :index] do
    concerns :eventful
    get "main" => 'generic#show'
  end
  
  resources :report_participants, only: [:show], controller: "report/participants"
  resources :responses, only: [:create], controller: "report/responses"

  resources :organizations do
    concerns :resourceful
    concerns :eventful
    resources :products, only: [:index], on: :member
    resources :organizations, only: [:index], on: :member
    resources :officials, controller: "affiliations" do
      collection do
        get 'contributee/new' => "affiliations#new"
        get 'executive/new' => "affiliations#new"
        get 'owner/new' => "affiliations#new"
        get 'contributee/:affiliation_id/edit' => "affiliations#edit"
        get 'executive/:affiliation_id/edit' => "affiliations#edit"
        get 'owner/:affiliation_id/edit' => "affiliations#edit"
      end
    end
  end

  resources :products do
    concerns :resourceful
    concerns :eventful
  end

  resources :officials do
    concerns :resourceful
    concerns :eventful
    resources :organizations, controller: "affiliations" do
      collection do
        get 'contributee/new' => "affiliations#new"
        get 'executive/new' => "affiliations#new"
        get 'owner/new' => "affiliations#new"
        get 'contributee/:affiliation_id/edit' => "affiliations#edit"
        get 'executive/:affiliation_id/edit' => "affiliations#edit"
        get 'owner/:affiliation_id/edit' => "affiliations#edit"
      end
    end
  end

  resource :discuss, controller: :generic
  
  resource :explore, only: [:show], controller: :generic do
    resources :everything, only: [:index], controller: :generic
    resources :organizations, only: [:index, :show], controller: :generic
    resources :officials, only: [:index, :show], controller: :generic
    resources :policies, only: [:index, :show], controller: :generic
    resources :products, only: [:index, :show], controller: :generic
  end

  resource :workdesk, only: [:show], controller: :generic do
    resources :recent_activities, path: 'recent_activity', only: [:index]
    resources :everything, only: [:index], controller: :generic
    resources :organizations, controller: :generic
    resources :officials, controller: :generic
    resources :policies, controller: :generic
    resources :products, controller: :generic
  end

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
