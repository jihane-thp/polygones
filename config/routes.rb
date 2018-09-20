Rails.application.routes.draw do

  root 'main/landing#index'
  get 'handler/error' => 'main/landing#error'

  get 'cgu' => 'main/landing#cgu'

  #devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  scope 'superadmin', module: 'superadmin', as: "superadmin" do
    get '/' => 'dashboard#index'
    resources :sites
    resources :users
    resources :products
    get 'sale' => "products#sale"
  end


  scope ':site/admin', module: 'admin', as: "admin" do
    get '/' => "dashboard#index"
    get 'update_template' => "templates#update_template"
    resources :templates

    resources :articles
    resources :categories
    resources :tabs , except: [:index, :show ]

    resources :comments, except: [:new, :create, :update, :edit ]

    resources :products
    resources :plugins, except: [:new, :create ]
    resources :carts
    resources :cart_products
    resources :orders, except: [ :update, :edit, :destroy ]
    get '/admin/cart_products/:product_id' => 'carts#add', as: 'add_product_in_cart'
    get '/remove/:product_id' => 'carts#remove', as: 'remove_product_in_cart'

    post 'pay' => 'orders#pay'
    get 'buy' => 'orders#buy'
    get 'new_tab_category'      => 'tabs#new_tab_category'

    get '/menu' => 'tabs#index'

    resources :sites, except: [:index, :new, :show, :create, :destroy ]
    get '/site/configuration' => 'sites#edit'


    get 'dashboard/index' => "dashboard#index"
    get '*path',   :to => 'dashboard#error'

  end

  post ":site/new_comment" => "handler#new_comment"

  get ':site'                 => "handler#web"
  get ':site/:slug1'          => "handler#web"
  get ':site/:slug1/:slug2'   => "handler#web"

  namespace :main do
    get 'landing/index'
    get 'landing/show'

  end
  namespace :web do
    get 'main/index'
    get 'main/show'

  end

  namespace :admin do
    get 'dashboard/index'
    get 'dashboard/show'
    get 'dashboard/login'
    get 'dashboard/signup'
  end


end
