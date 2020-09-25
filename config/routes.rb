Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  action: :welcome, controller: 'site'
  post 'show_next_options/:entity/(:entity_id)', action: 'show_next_options', controller: 'site'
  post 'start_testing', action: 'start_testing', controller: 'site'
  post 'show_start_button', action: 'show_start_button', controller: 'site'
  post 'show_lecturers_list', action: 'show_lecturers_list', controller: 'site'
  post 'show_stats', action: 'show_stats', controller: 'site'
  resources :faculties
  resources :questionnaires
  resources :disciplines
  resources :departments
  resources :university_groups
  resources :lecturers
end
