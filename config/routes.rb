Rails.application.routes.draw do


  devise_for :users, controllers: { sessions:'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations', passwords: 'users/passwords'}
  
  scope "/admin" do
  	resources :users
  end

  resources :agendas
  resources :pets
  resources :sitters
  resources :admin

  root to: "home#index"

  get '/sitters/confirmation/:id', to: 'sitters#confirmation', as: 'sitters_confirmation'
  get '/agendas/confirmation/:id', to: 'agendas#confirmation', as: 'agendas_confirmation'
  get '/scheduled_sittings', to: 'sitters#scheduled_sittings', as: 'scheduled_sittings'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
