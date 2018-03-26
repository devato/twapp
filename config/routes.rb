Rails.application.routes.draw do

  root to: 'api/twitter#index'

  namespace :api do
    resources :twitter
  end
end
