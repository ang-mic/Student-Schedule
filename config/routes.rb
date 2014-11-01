StudentSchedules::Application.routes.draw do

  get 'admin', to: "access/login"

  devise_scope :student do
    root to: "devise/sessions#new"
  end

  devise_for :societies
  devise_for :students

  #dashboard
  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard'

  #cms
  get 'cms/index', to: 'cms#index', as: 'cms'

  #root route
  # root 'students#index'

  resources :departments do
    resources :courses
  end

  #This route applies only to the index action and timetable
  resources :courses, :only => [:index,:timetables] do
    member do
      get 'timetables'
    end
  end

  resources :timetables do
     resources :university_events
     resources :lectures
     resources :labs
  end

  resources :timetables do
     member do
      get 'student_timetables'
     end
  end

  resources :webmasters

  resources :course_modules
  resources :user_events
  resources :societies

  resources :students do
    member do
      get 'shered/home'
    end
  end

  # resources :university_events
  resources :lectures
  resources :labs



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'webmasters#index'

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

  match ':controller(/:action(/:id))', :via => [:get, :post]

end
