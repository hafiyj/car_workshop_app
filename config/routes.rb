Rails.application.routes.draw do

  root                     'landing_pages#home'
  get     'about'       => 'landing_pages#about'
  get     'contact'     => 'landing_pages#contact'
  get     'help'        => 'landing_pages#help'

  get     'signup'      => 'workshops#new'

  get     'login'       => 'sessions#new'
  post    'login'       => 'sessions#create'
  delete  'logout'      => 'sessions#destroy'

  get     'new_reserv'  => 'reservations#new'
  resources :workshops
  resources :reservations
end
