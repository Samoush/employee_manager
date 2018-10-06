Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :employers, except: [:show]
  resources :employees, except: [:show]
  root 'employers#index'
end
