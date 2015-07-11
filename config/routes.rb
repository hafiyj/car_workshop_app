Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  root                       'landing_pages#home'
  get     'about'         => 'landing_pages#about'
  get     'contact'       => 'landing_pages#contact'
  get     'help'          => 'landing_pages#help'

  get     'signup'        => 'workshops#new'
  get     'all_workshops' => 'workshops#index'
# get     'edit_workshop' => 'workshops#edit'

  get     'login'         => 'sessions#new'
  post    'login'         => 'sessions#create'
  delete  'logout'        => 'sessions#destroy'

  get     'new_reserv'    => 'reservations#new'

  resources :workshops
  resources :reservations
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
