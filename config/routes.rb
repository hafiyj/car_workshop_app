Rails.application.routes.draw do


  root 'lander_pages#home'
  resources :reservations
  # get  'reservation' => 'reservation#new'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root                   'landing_pages#home'
  get   'about'       => 'landing_pages#about'
  get   'contact'     => 'landing_pages#contact'
  get   'help'        => 'landing_pages#help'
  
  get   'reservation' => 'reservation#new'
  
end
