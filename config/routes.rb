Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  action: :welcome, controller: 'site'
  post 'show_next_options/:entity/(:entity_id)', action: 'show_next_options', controller: 'site'
  post 'start_testing', action: 'start_testing', controller: 'site'
  post 'show_start_button', action: 'show_start_button', controller: 'site'
  post 'show_lecturers_list', action: 'show_lecturers_list', controller: 'site'
  post 'show_stats', action: 'show_stats', controller: 'site'
  get 'main_panel', action: 'main_panel', controller: 'site'

  resources :faculties
  resources :questionnaires
  resources :disciplines
  resources :departments
  resources :university_groups
  resources :lecturers

  scope module: 'api' do
    namespace 'v1' do
      resources :lecturers, only: [:show, :index]
      resources :disciplines, only: [:show, :index]
      resources :faculties, only: [:show, :index]
      resources :departments, only: [:show, :index]
      resources :university_groups, only: [:show, :index]
      resources :questionnaires, only: [:create]
    end
  end

end
