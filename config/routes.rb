Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  action: :welcome, controller: 'site'
  resources :faculties
  resources :questionnaires
  resources :disciplines
  post 'get_departments', action: 'get_departments', controller: 'site'
  post 'get_university_groups', action: 'get_university_groups', controller: 'site'
  post 'get_start_button', action: 'get_start_button', controller: 'site'
end
