MyHealtheNetwork::Application.routes.draw do

  resources :users_meds

  get 'frequency_units' => 'users_meds#frequency_units'

  devise_for :users, controllers: { registrations: "registrations" }
  authenticated :user do
    root 'site#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  ActiveAdmin.routes(self)

end
