Rails.application.routes.draw do

  root                      'landing_pages#home'
  get     'about'         => 'landing_pages#about'
  get     'contact'       => 'landing_pages#contact'
  get     'help'          => 'landing_pages#help'

  get     'signup'        => 'workshops#new'
# get     'edit_workshop' => 'workshops#edit'

  get     'login'         => 'sessions#new'
  post    'login'         => 'sessions#create'
  delete  'logout'        => 'sessions#destroy'

  get     'new_reserv'    => 'reservations#new'
  get 'customers' => 'customers#index'
  get 'customers/show' => 'customers#show'

  resources :workshops
  resources :reservations
end
