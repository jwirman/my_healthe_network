MyHealtheNetwork::Application.routes.draw do

  resources :scans
  resources :users_meds
  resources :daily_users_meds, controller: :users_meds
  resources :weekly_users_meds, controller: :users_meds
  resources :monthly_users_meds, controller: :users_meds
  resources :hourly_users_meds, controller: :users_meds

  get 'frequency_units' => 'users_meds#frequency_units'
  get 'faq' => 'site#faq'
  get 'chart' => 'site#chart'
  get 'network' => 'site#network'
  get 'generate_calendar_events' => 'site#generate_calendar_events'

  devise_for :users, controllers: { registrations: "registrations" }
  authenticated :user do
    root 'site#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  ActiveAdmin.routes(self)

end
