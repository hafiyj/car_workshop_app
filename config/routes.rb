Rails.application.routes.draw do

  get 'customers' => 'customers#index'
  get 'customers/show' => 'customers#show'


  get  'reservation' => 'reservation#new'

  
  root                   'landing_pages#home'
  get   'about'       => 'landing_pages#about'
  get   'contact'     => 'landing_pages#contact'
  get   'help'        => 'landing_pages#help'
  
  get   'signup'      => 'workshops#new'

  resources :workshops
  resources :reservations
end
