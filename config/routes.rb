Rails.application.routes.draw do

  get 'workshops/new'

  root                   'landing_pages#home'
  get   'about'       => 'landing_pages#about'
  get   'contact'     => 'landing_pages#contact'
  get   'help'        => 'landing_pages#help'
  
  get   'reservation' => 'reservation#new'
  
  get   'signup'      => 'workshops#new'
end
