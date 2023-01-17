Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :departments, only: [:index]
  resources :employees, only: [:show]
  resources :employee_tickets, only: [:destroy]
end
