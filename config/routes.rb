Rails.application.routes.draw do

  root                   'landing_pages#home'
  get   'about'       => 'landing_pages#about'
  get   'contact'     => 'landing_pages#contact'
  get   'help'        => 'landing_pages#help'
  
  get   'reservation' => 'reservation#new'
  
end
