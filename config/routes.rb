Rails.application.routes.draw do

  namespace :api do
    root to: 'tweets#list'
    resources :topics, only: [:index]
    resources :tweets, only: [] do
      collection do
        get ':topic_id' => 'tweets#list', as: :list
        get '/' => 'tweets#list', as: :no_topic_list
        get ':topic_id/limit/:limit' => 'tweets#list', as: :limit_list
        post :tweet
      end
    end
  end
end
