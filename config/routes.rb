Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }



  resources :users

  resources :products, only: [:index] do
    delete 'orders/:order_id', to: 'products#destroy',  as: 'destroy'
    resource  :orders, only: [:create]
  end

  resources :billings, only: [] do
      collection do
          get 'pre_pay'
          get 'execute'
        end
  end


  get 'orders/:id_order', to: 'orders#pagar',  as: 'pagar'


  resources  'orders', only: :index

  root  'products#index'

end
