Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  action: :welcome, controller: 'site'
  resources :faculties
  post 'get_departments', action: 'get_departments', controller: 'site'

end
