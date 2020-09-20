Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  action: :welcome, controller: 'site'
  post 'get_next_html_select/:type/(:id)', action: 'get_next_html_select', controller: 'site'
  post 'start_testing', action: 'start_testing', controller: 'site'
  resources :faculties
  resources :questionnaires
  resources :disciplines
end
