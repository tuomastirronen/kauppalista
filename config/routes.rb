Rails.application.routes.draw do

  resource 'items'
  # get 'items/index'

  root 'items#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
